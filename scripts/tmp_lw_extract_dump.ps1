$ErrorActionPreference = 'Stop'

# 3 barbers
$barbers = @('CM','GRZ','PP')
foreach ($b in $barbers) {
    $src = "build/lw_extract/TheThaumaturge/Content/GrimoireContent/Quests/Dialogues/LivingWorld/lw_Barbers/$b/${b}_barber.uasset"
    $dst = "build/work/lw_barbers/${b}_barber.json"
    $csv = "source/pl/${b}_barber.csv"
    Write-Host "=== $b barber ==="
    & .\tools\UAssetGUI\UAssetGUI.exe tojson $src $dst VER_UE5_1 Mappings | Out-Null
    & .\scripts\dialog_dump.ps1 -JsonPath $dst -CsvPath $csv
}

# lw_smg01 main assets
$mainDir = "build/lw_extract/TheThaumaturge/Content/GrimoireContent/Quests/Dialogues/LivingWorld/lw_smg01/Assets"
Get-ChildItem "$mainDir/*.uasset" | ForEach-Object {
    $name = $_.BaseName
    $src = $_.FullName
    $dst = "build/work/lw_smg01/$name.json"
    $csv = "source/pl/$name.csv"
    Write-Host "=== $name (main) ==="
    & .\tools\UAssetGUI\UAssetGUI.exe tojson $src $dst VER_UE5_1 Mappings | Out-Null
    & .\scripts\dialog_dump.ps1 -JsonPath $dst -CsvPath $csv
}

# lw_smg01 chat assets
$chatDir = "build/lw_extract/TheThaumaturge/Content/GrimoireContent/Quests/Dialogues/LivingWorld/lw_smg01/Chats"
Get-ChildItem "$chatDir/*.uasset" | ForEach-Object {
    $name = $_.BaseName
    $src = $_.FullName
    $dst = "build/work/lw_smg01/$name.json"
    $csv = "source/pl/$name.csv"
    Write-Host "=== $name (chat) ==="
    & .\tools\UAssetGUI\UAssetGUI.exe tojson $src $dst VER_UE5_1 Mappings | Out-Null
    & .\scripts\dialog_dump.ps1 -JsonPath $dst -CsvPath $csv -AllRawExports
}
