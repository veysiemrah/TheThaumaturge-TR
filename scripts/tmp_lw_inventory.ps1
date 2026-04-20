# tmp_lw_inventory.ps1
# lw_* alt quest'lerdeki top-level Assets + Chats uasset sayılarını listele.

$dialogRoot = "build\lw_extract\TheThaumaturge\Content\GrimoireContent\Quests\Dialogues"

$lwDirs = Get-ChildItem $dialogRoot -Directory | Where-Object { $_.Name.StartsWith("lw_") }

$total = 0
foreach ($d in $lwDirs) {
    $assetCount = 0
    $chatCount = 0

    $assetsDir = Join-Path $d.FullName "Assets"
    $chatsDir  = Join-Path $d.FullName "Chats"

    if (Test-Path $assetsDir) {
        $assetCount = (Get-ChildItem $assetsDir -Filter '*.uasset').Count
    }
    if (Test-Path $chatsDir) {
        $chatCount = (Get-ChildItem $chatsDir -Filter '*.uasset').Count
    }

    $subtotal = $assetCount + $chatCount
    $total += $subtotal
    Write-Host ("{0,-25} Assets={1,3}  Chats={2,3}  Total={3,3}" -f $d.Name, $assetCount, $chatCount, $subtotal)
}

Write-Host ""
Write-Host ("TOPLAM: {0}" -f $total)
