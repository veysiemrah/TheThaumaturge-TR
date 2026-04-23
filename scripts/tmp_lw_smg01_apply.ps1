$ErrorActionPreference = 'Stop'

# lw_smg01 main assets
$mainDir = "build/work/lw_smg01"
Get-ChildItem "$mainDir/smg01_*.json" | Where-Object { $_.Name -notmatch '_tr\.json$' } | ForEach-Object {
    $name = $_.BaseName
    Write-Host "=== $name ==="
    & .\scripts\dialog_apply.ps1 -JsonPath $_.FullName -CsvPath "translation/$name.csv" -OutJsonPath "$mainDir/${name}_tr.json"

    $staging = "build/staging/TheThaumaturge/Content/GrimoireContent/Quests/Dialogues/LivingWorld/lw_smg01/Assets"
    New-Item -ItemType Directory -Path $staging -Force | Out-Null
    & .\tools\UAssetGUI\UAssetGUI.exe fromjson "$mainDir/${name}_tr.json" "$staging/$name.uasset" Mappings | Out-Null
}
