#!/bin/bash
ASSETS=(
  q001_00_player_chats
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
  pwsh -File scripts/dialog_dump.ps1 \
    -JsonPath "build/dialogue_analysis/${f}.json" \
    -CsvPath "source/pl/${f}.csv" \
    -SkipNumericTexts -AllRawExports 2>&1 | tail -1
done
