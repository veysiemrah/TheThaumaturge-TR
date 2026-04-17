# stringtable_edit.ps1
# UAssetGUI'nin JSON çıktısındaki StringTable "Data" base64 blob'unu parse eder
# ve verilen key'in value'sunu değiştirir.
#
# UE FString format:
#   Positive length -> UTF-8 bytes (including null terminator)
#   Negative length -> UTF-16 LE characters (including null terminator)
#   Zero -> empty string

param(
    [Parameter(Mandatory=$true)] [string] $JsonPath,
    [Parameter(Mandatory=$true)] [string] $Key,
    [Parameter(Mandatory=$true)] [string] $NewValue,
    [string] $OutPath = $null  # Default: overwrite JsonPath
)

if (-not $OutPath) { $OutPath = $JsonPath }

function Read-FString {
    param([byte[]] $data, [ref] $pos)
    $len = [BitConverter]::ToInt32($data, $pos.Value); $pos.Value += 4
    if ($len -eq 0) { return "" }
    if ($len -gt 0) {
        # UTF-8, len = byte count incl null
        $str = [System.Text.Encoding]::UTF8.GetString($data, $pos.Value, $len - 1)
        $pos.Value += $len
        return $str
    } else {
        # UTF-16 LE, -len = char count incl null
        $chars = -$len
        $str = [System.Text.Encoding]::Unicode.GetString($data, $pos.Value, ($chars - 1) * 2)
        $pos.Value += $chars * 2
        return $str
    }
}

function Write-FString {
    param([string] $s)
    if ($s.Length -eq 0) {
        return [BitConverter]::GetBytes([int32]0)
    }
    # Check if ASCII-only
    $asciiOnly = $true
    foreach ($c in $s.ToCharArray()) { if ([int]$c -gt 0x7F) { $asciiOnly = $false; break } }
    if ($asciiOnly) {
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($s + "`0")
        return [BitConverter]::GetBytes([int32]$bytes.Length) + $bytes
    } else {
        $bytes = [System.Text.Encoding]::Unicode.GetBytes($s + "`0")
        $chars = $bytes.Length / 2
        return [BitConverter]::GetBytes([int32](-$chars)) + $bytes
    }
}

# Read JSON
$jsonText = Get-Content $JsonPath -Raw
$json = $jsonText | ConvertFrom-Json -Depth 50

# Find the export with StringTable data
$export = $json.Exports | Where-Object { $_.'$type' -match "RawExport" } | Select-Object -First 1
if (-not $export) { throw "RawExport bulunamadı." }

$data = [Convert]::FromBase64String($export.Data)
Write-Host "Original data size: $($data.Length) bytes"

# Parse StringTable structure
# Header flags (varies by UE version, usually 2-5 bytes) — we use a heuristic
# Actually UE StringTable serialization is:
#   - Namespace (FString)
#   - Entry count (u32)
#   - Entries: Key (FString) + Value (FString)
#   - Meta data (optional)
# But in raw export it has some header bytes before the namespace.
# Let's find the namespace by looking for ASCII table name pattern.

$pos = 0
# Skip initial header bytes (before namespace FString)
# UE's StringTable::SerializeExport writes:
#   - TableId (FName or FString, varies)
# In this dump, the initial bytes look like: 00 01 00 00 00 00
# Then the namespace starts at offset 6 (length prefix).
# Let me just find the namespace by pattern.

# Pattern-based: find the first length-prefixed string matching "Achievements_ST" or table name
$found = $false
for ($i = 0; $i -lt 32; $i++) {
    $len = [BitConverter]::ToInt32($data, $i)
    if ($len -gt 0 -and $len -lt 256 -and ($i + 4 + $len -le $data.Length)) {
        $candidate = [System.Text.Encoding]::UTF8.GetString($data, $i + 4, $len - 1)
        if ($candidate -match "^[a-zA-Z][a-zA-Z0-9_]+$") {
            Write-Host "Namespace found at offset ${i}: '$candidate' (length $len)"
            $pos = $i + 4 + $len
            $found = $true
            break
        }
    }
}
if (-not $found) { throw "Namespace bulunamadı." }

# Entry count
$count = [BitConverter]::ToInt32($data, $pos); $pos += 4
Write-Host "Entry count: $count"

# Parse entries, find target key
$entries = @()
for ($e = 0; $e -lt $count; $e++) {
    $keyStart = $pos
    $k = Read-FString -data $data -pos ([ref]$pos)
    $valStart = $pos
    $v = Read-FString -data $data -pos ([ref]$pos)
    $entries += [PSCustomObject]@{ Index = $e; Key = $k; Value = $v; KeyStart = $keyStart; ValStart = $valStart; EntryEnd = $pos }
}

$target = $entries | Where-Object { $_.Key -eq $Key } | Select-Object -First 1
if (-not $target) {
    Write-Host ""
    Write-Host "Key '$Key' bulunamadı. Mevcut anahtarlardan örnekler:"
    $entries | Select-Object -First 10 | ForEach-Object { "  $($_.Key) = '$($_.Value)'" }
    throw "Key bulunamadı: $Key"
}

Write-Host ""
Write-Host "Target entry:"
Write-Host "  Key:      $($target.Key)"
Write-Host "  Old val:  $($target.Value)"
Write-Host "  New val:  $NewValue"
Write-Host "  Range:    [$($target.ValStart)..$($target.EntryEnd)]"

# Rebuild data: head + key + old(replaced with new) + tail
$head = $data[0..($target.ValStart - 1)]
$tail = $data[$target.EntryEnd..($data.Length - 1)]
$newValBytes = Write-FString -s $NewValue
$newData = [byte[]]($head + $newValBytes + $tail)
Write-Host "New data size: $($newData.Length) bytes (delta $($newData.Length - $data.Length))"

# Write back as base64
$newBase64 = [Convert]::ToBase64String($newData)
$export.Data = $newBase64

$json | ConvertTo-Json -Depth 50 -Compress:$false | Set-Content $OutPath -Encoding UTF8
Write-Host "JSON yazıldı: $OutPath"
