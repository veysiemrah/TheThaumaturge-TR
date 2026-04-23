$ErrorActionPreference = 'Stop'

$mainDir = "build/work/lw_smg01"
$chatStaging = "build/staging/TheThaumaturge/Content/GrimoireContent/Quests/Dialogues/LivingWorld/lw_smg01/Chats"
New-Item -ItemType Directory -Path $chatStaging -Force | Out-Null

Get-ChildItem "$mainDir/lw_smg01_*.json" | Where-Object { $_.Name -notmatch '_tr\.json$' } | ForEach-Object {
    $name = $_.BaseName
    Write-Host "=== $name ==="
    & .\scripts\dialog_apply.ps1 -JsonPath $_.FullName -CsvPath "translation/$name.csv" -OutJsonPath "$mainDir/${name}_tr.json" -AllRawExports
    & .\tools\UAssetGUI\UAssetGUI.exe fromjson "$mainDir/${name}_tr.json" "$chatStaging/$name.uasset" Mappings | Out-Null
}
