#!/bin/bash
set -e
mkdir -p build/work
STAGING="build/staging/TheThaumaturge/Content/GrimoireContent/Quests/Dialogues/q101/Chats"
mkdir -p "${STAGING}"
ASSETS=(
  q101_00a_parade_observers_chat
  q101_00b_newcomers_and_locals_chat
  q101_01a_kettling_officers_chat
  q101_01b_kettling_worker_chat
  q101_01c_kettling_single_chats
  q101_01d_cell_policeman_chat
  q101_02_cemetery_entrance_chat
  q101_02a_cemetery_chats
  q101_02b_undertaker_chat
  q101_02c_burial_chat
  q101_02d_mordechaj_and_woronin_chat
  q101_03a_about_rain_chat
  q101_03b_woronin_bottle_chat
  q101_03c_burial_guests_chat
  q101_03d_ligia_with_notary_chat
  q101_ligia_and_woronin_chat
)
for f in "${ASSETS[@]}"; do
  out=$(pwsh -File scripts/dialog_apply.ps1 \
    -JsonPath "build/dialogue_analysis/${f}.json" \
    -CsvPath "translation/${f}.csv" \
    -OutJsonPath "build/work/${f}_tr.json" \
    -AllRawExports 2>&1 | grep -E "Replaced")
  echo "${f}: ${out}"
  ./tools/UAssetGUI/UAssetGUI.exe fromjson \
    "build/work/${f}_tr.json" \
    "${STAGING}/${f}.uasset" \
    tools/Mappings > /dev/null 2>&1
  sleep 1
done
