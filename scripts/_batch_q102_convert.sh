#!/bin/bash
ASSETS_MAIN=(
  q102_00b_ligia_about_grimoire
  q102_00c_ligia_bedroom
  q102_00d_grazyna_kitchen
  q102_01a_kidnapping
  q102_02a_london_bar_intro
  q102_02b_london_bar_main_hall
  q102_02c_london_bar_conclusion
  q102_02d_london_bar_abaurycy
  q102_03b_cossacks_outside
  q102_04a_art_bar
  q102_05_side_bar_cossacks
  q102_05a_side_bar_entrance
  q102_05b_side_bar
  q102_05c_side_bar_danis
  q102_05d_side_bar_conclusion
  q102_05e_lelek
  q102_05f_resolution
  q102_05g_party
  q102_06a_aftermath
)
CHATS=(
  q102_01b_abaurycy_bar_chats
  q102_01c_london_bouncer_chats
  q102_02a_abaurycy_outside_chats
  q102_03b_cossacks_outside_chats
  q102_04a_art_bar_chats
  q102_05a_side_bar_entrance_chats
  q102_05c_side_bar_cossacks_chats
  q102_05c_side_bar_danis_chats
)
for f in "${ASSETS_MAIN[@]}"; do
  ./tools/UAssetGUI/UAssetGUI.exe tojson \
    "build/dialogue_analysis/TheThaumaturge/Content/GrimoireContent/Quests/Dialogues/q102/Assets/${f}.uasset" \
    "build/dialogue_analysis/${f}.json" VER_UE5_1 tools/Mappings > /dev/null 2>&1
  sleep 1
  [ -f "build/dialogue_analysis/${f}.json" ] && echo "OK A: ${f}" || echo "FAIL A: ${f}"
done
for f in "${CHATS[@]}"; do
  ./tools/UAssetGUI/UAssetGUI.exe tojson \
    "build/dialogue_analysis/TheThaumaturge/Content/GrimoireContent/Quests/Dialogues/q102/Chats/${f}.uasset" \
    "build/dialogue_analysis/${f}.json" VER_UE5_1 tools/Mappings > /dev/null 2>&1
  sleep 1
  [ -f "build/dialogue_analysis/${f}.json" ] && echo "OK C: ${f}" || echo "FAIL C: ${f}"
done
