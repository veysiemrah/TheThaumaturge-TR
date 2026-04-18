#!/bin/bash
set -e
mkdir -p build/work
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
  out=$(pwsh -File scripts/dialog_apply.ps1 \
    -JsonPath "build/dialogue_analysis/${f}.json" \
    -CsvPath "translation/${f}.csv" \
    -OutJsonPath "build/work/${f}_tr.json" \
    -AllRawExports 2>&1 | grep -E "Replaced|FAIL")
  echo "${f}: ${out}"
done
