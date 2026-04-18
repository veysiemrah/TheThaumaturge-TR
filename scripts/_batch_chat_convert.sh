#!/bin/bash
ASSETS=(
  q001_00_postmaster_chats
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
)
for f in "${ASSETS[@]}"; do
  ./tools/UAssetGUI/UAssetGUI.exe tojson \
    "build/dialogue_analysis/TheThaumaturge/Content/GrimoireContent/Quests/Dialogues/q001/Chats/${f}.uasset" \
    "build/dialogue_analysis/${f}.json" VER_UE5_1 tools/Mappings > /dev/null 2>&1
  sleep 1
  if [ -f "build/dialogue_analysis/${f}.json" ]; then
    echo "OK: ${f}"
  else
    echo "FAIL: ${f}"
  fi
done
