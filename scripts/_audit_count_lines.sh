#!/bin/bash
# Tüm audit kategorilerinin toplam satır sayısını tahmini olarak çıkar.
set +e

sum_category() {
  local dir="$1"
  local label="$2"
  local total=0
  local count=0
  while IFS= read -r asset; do
    count=$((count + 1))
    local name=$(basename "$asset" .uasset)
    ./tools/UAssetGUI/UAssetGUI.exe tojson "$asset" "build/audit_tmp.json" VER_UE5_1 tools/Mappings > /dev/null 2>&1
    sleep 0.3
    if [ -f "build/audit_tmp.json" ]; then
      local lines=$(pwsh -File scripts/dialog_dump.ps1 -JsonPath "build/audit_tmp.json" -CsvPath "build/audit_tmp.csv" -SkipNumericTexts -AllRawExports 2>&1 | grep "Toplam" | grep -oE "[0-9]+")
      if [ -n "$lines" ]; then
        total=$((total + lines))
      fi
      rm -f build/audit_tmp.json build/audit_tmp.csv
    fi
  done < <(find "$dir" -name "*.uasset")
  echo "${label}: ${count} asset / ${total} satır"
}

echo "--- Readables ---"
sum_category "build/audit_content/TheThaumaturge/Content/GrimoireContent/Quests/Readables" "Readables"
echo "--- Journal (quest) ---"
sum_category "build/audit_content/TheThaumaturge/Content/GrimoireContent/Quests/Journal" "Journal"
echo "--- InsightsConclusions ---"
sum_category "build/audit_content/TheThaumaturge/Content/GrimoireContent/Quests/InsightsConclusions" "InsightsConclusions"
echo "--- Vset (ortam NPC) — sadece ilk 50 örnek ---"
count=0
total=0
while IFS= read -r asset; do
  count=$((count + 1))
  if [ "$count" -gt 50 ]; then break; fi
  ./tools/UAssetGUI/UAssetGUI.exe tojson "$asset" "build/audit_tmp.json" VER_UE5_1 tools/Mappings > /dev/null 2>&1
  sleep 0.3
  if [ -f "build/audit_tmp.json" ]; then
    lines=$(pwsh -File scripts/dialog_dump.ps1 -JsonPath "build/audit_tmp.json" -CsvPath "build/audit_tmp.csv" -SkipNumericTexts -AllRawExports 2>&1 | grep "Toplam" | grep -oE "[0-9]+")
    if [ -n "$lines" ]; then
      total=$((total + lines))
    fi
    rm -f build/audit_tmp.json build/audit_tmp.csv
  fi
done < <(find "build/audit_content/TheThaumaturge/Content/GrimoireContent/Quests/Vset" -name "*.uasset")
avg=$((total / 50))
vset_total=$((avg * 508))
echo "Vset: 508 asset, ilk 50 örnekten ortalama ${avg} satır/asset → tahmini ${vset_total} satır"
