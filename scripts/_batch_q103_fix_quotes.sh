#!/bin/bash
for f in translation/q103_*.csv; do
  pwsh -File scripts/_fix_csv_quotes.ps1 -CsvPath "$f" 2>&1
done
