#!/bin/bash
set -e
mkdir -p build/work
STAGING_A="build/staging/TheThaumaturge/Content/GrimoireContent/Quests/Dialogues/q103/Assets"
STAGING_C="build/staging/TheThaumaturge/Content/GrimoireContent/Quests/Dialogues/q103/Chats"
mkdir -p "${STAGING_A}" "${STAGING_C}"
ASSETS_MAIN=(
  q103_00a_ligia_in_living_room
  q103_00b_phonecall_from_rasputin
  q103_01b_rasputin_and_aniela
  q103_01c_aniela_maid_door
  q103_01d_rasputin_hypnosis
  q103_02a_portier_talk
  q103_02b_elegant_men
  q103_02b_weles_vision_entrance
  q103_02c_konietchkin_in_hotel
  q103_02d_zofia_lobby
  q103_02e_svetlana_party
  q103_03a_ligia_party
  q103_03c_medium_presentation
  q103_03e_upyr_conclusion
  q103_04b_medium_closing_apartment
  q103_04c_session_started
  q103_04d_ritual_consequences
  q103_04d_zofia_alone
  q103_05a_konietchkin_ligia_leave
  q103_05b_ligia_home
  q103_06c_svetlana_request
)
CHATS=(
  q103_00a_player_phone_ringing_chats
  q103_01b_rasputin_and_aniela_chats
  q103_01c_aniela_maid_chats
  q103_02b_elegant_men_after_fight
  q103_02b_elegant_men_lobby_chats
  q103_02d_zofia_lobby_chat
  q103_02e_svetlana_party_chat
  q103_03a_ligia_party_chat
  q103_03c_samira_party_chat
  q103_03l_konietchkin_chats
  q103_04g_countess_vset_chats
  q103_04h_scientist_vset_chats
)
for f in "${ASSETS_MAIN[@]}"; do
  out=$(pwsh -File scripts/dialog_apply.ps1 \
    -JsonPath "build/dialogue_analysis/${f}.json" \
    -CsvPath "translation/${f}.csv" \
    -OutJsonPath "build/work/${f}_tr.json" 2>&1 | grep -E "Replaced")
  echo "A ${f}: ${out}"
  ./tools/UAssetGUI/UAssetGUI.exe fromjson \
    "build/work/${f}_tr.json" \
    "${STAGING_A}/${f}.uasset" \
    tools/Mappings > /dev/null 2>&1
  sleep 1
done
for f in "${CHATS[@]}"; do
  out=$(pwsh -File scripts/dialog_apply.ps1 \
    -JsonPath "build/dialogue_analysis/${f}.json" \
    -CsvPath "translation/${f}.csv" \
    -OutJsonPath "build/work/${f}_tr.json" \
    -AllRawExports 2>&1 | grep -E "Replaced")
  echo "C ${f}: ${out}"
  ./tools/UAssetGUI/UAssetGUI.exe fromjson \
    "build/work/${f}_tr.json" \
    "${STAGING_C}/${f}.uasset" \
    tools/Mappings > /dev/null 2>&1
  sleep 1
done
