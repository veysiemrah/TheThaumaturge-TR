#!/bin/bash
set -e
mkdir -p build/work
STAGING="build/staging/TheThaumaturge/Content/GrimoireContent/Quests/Dialogues/q101/Assets"
mkdir -p "${STAGING}"
ASSETS=(
  q101_02_cemetery_entrance
  q101_02a_ligia_in_cemetery
  q101_02b_fathers_grave
  q101_02c_leaving_cemetery
  q101_02d_woronin_mausoleum
  q101_02e_woronin_at_funeral_talk
  q101_02f_mordechaj_mausoleum_talk
  q101_03a_grazyna_greetings
  q101_03b_testament_reading
  q101_03e_notary_before_testament
  q101_03f_woronin_before_testament
  q101_03g_woronin_son_talk
)
for f in "${ASSETS[@]}"; do
  out=$(pwsh -File scripts/dialog_apply.ps1 \
    -JsonPath "build/dialogue_analysis/${f}.json" \
    -CsvPath "translation/${f}.csv" \
    -OutJsonPath "build/work/${f}_tr.json" 2>&1 | grep -E "Replaced|FAIL")
  echo "${f} apply: ${out}"
  ./tools/UAssetGUI/UAssetGUI.exe fromjson \
    "build/work/${f}_tr.json" \
    "${STAGING}/${f}.uasset" \
    tools/Mappings > /dev/null 2>&1
  sleep 1
  if [ -f "${STAGING}/${f}.uasset" ]; then
    echo "${f} staged: OK"
  else
    echo "${f} staged: FAIL"
  fi
done
