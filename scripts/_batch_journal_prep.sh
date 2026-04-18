#!/bin/bash
# Tüm Journal asset'lerini JSON'a çevir + source/pl CSV dump
set +e
ROOT="build/audit_content/TheThaumaturge/Content/GrimoireContent/Quests/Journal"
mkdir -p source/pl build/journal_json

while IFS= read -r asset; do
  name=$(basename "$asset" .uasset)
  ./tools/UAssetGUI/UAssetGUI.exe tojson "$asset" "build/journal_json/${name}.json" VER_UE5_1 tools/Mappings > /dev/null 2>&1
  sleep 0.6
  if [ -f "build/journal_json/${name}.json" ]; then
    out=$(pwsh -File scripts/dialog_dump.ps1 \
      -JsonPath "build/journal_json/${name}.json" \
      -CsvPath "source/pl/${name}.csv" \
      -SkipNumericTexts -AllRawExports 2>&1 | grep "Toplam")
    echo "${name}: ${out}"
  else
    echo "FAIL: ${name}"
  fi
done < <(find "$ROOT" -name "*.uasset")
