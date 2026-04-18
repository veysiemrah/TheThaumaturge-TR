#!/bin/bash
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
  out=$(pwsh -File scripts/validate_csv_columns.ps1 -CsvPath "translation/${f}.csv" 2>&1 | grep -E "uyuşmazlığı|FAIL|HATA")
  echo "${f}: ${out}"
done
