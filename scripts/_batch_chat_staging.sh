#!/bin/bash
set -e
STAGING="build/staging/TheThaumaturge/Content/GrimoireContent/Quests/Dialogues/q001/Chats"
mkdir -p "${STAGING}"
ASSETS=(
  q001_00_player_chats
  q001_00_postmaster_chats
  q001_00_wagoner_chats
  q001_01_tavern_rasputin_teaching_chats
  q001_01_village_entering_tavern_chats
  q001_03_rasputin_cemetery_chats
  q001_04_burned_house_rasputin_chats
  q001_05_village_neighbours_chat
  q001_05_village_vesna_chats
  q001_06_village_argument_chats
  q001_06_wise_woman_chat
  q001_07_rasputin_chat
  q001_08_before_confrontantion_chats
  q001_09_traveler_chat
)
for f in "${ASSETS[@]}"; do
  ./tools/UAssetGUI/UAssetGUI.exe fromjson \
    "build/work/${f}_tr.json" \
    "${STAGING}/${f}.uasset" \
    tools/Mappings > /dev/null 2>&1
  sleep 1
  if [ -f "${STAGING}/${f}.uasset" ]; then
    echo "OK: ${f}.uasset"
  else
    echo "FAIL: ${f}.uasset"
  fi
done
