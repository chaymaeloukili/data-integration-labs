#!/bin/bash
# get_data.sh downloads the bike counts of Cologne 2022 and takes a first look at them.
# How to run: cd labs/03 && ./get_data.sh  (the data goes to data/raw/, which Git ignores)
#
# Source: "Fahrrad-Verkehrsdaten Köln 2022", Stadt Köln, Offene Daten Köln,
#         https://www.offenedaten-koeln.de/dataset/fahrrad-verkehrsdaten-koeln-2022
# Licence: Datenlizenz Deutschland – Zero – Version 2.0 (https://www.govdata.de/dl-de/zero-2-0)
#
# Why not my dataset from lab 1 (Destatis 12411-0003)? GENESIS-Online only offers a
# download button in the browser (a blob: link), so there is no URL that curl can use.
# The task allows the Cologne bike counts in this case.
# Attribution from lab 1: "Bevölkerung: Deutschland, Stichtag, Geschlecht (12411-0003)",
# Statistisches Bundesamt (Destatis), GENESIS-Online, Datenlizenz Deutschland – Namensnennung – Version 2.0.

URL="https://www.offenedaten-koeln.de/sites/default/files/distribution/Radverkehr%2520f%25C3%25BCr%2520Offene%2520Daten%2520K%25C3%25B6ln%25202022.csv"
TARGET="data/raw/koeln_2022.csv"

mkdir -p data/raw
curl -fL -o "$TARGET" "$URL" || exit 1

echo "$(date '+%Y-%m-%d %H:%M:%S') $URL $TARGET" >> data/raw/SOURCES.txt

echo "== Size"
ls -lh "$TARGET"
echo "== Type"
file "$TARGET"
echo "== Lines"
wc -l < "$TARGET"
echo "== Columns"
head -n 1 "$TARGET" | LC_ALL=C tr ';' '\n' | wc -l
echo "== First lines"
head -n 3 "$TARGET" | iconv -f ISO-8859-1 -t UTF-8

# Comparison with dataset.md (lab 1): the numbers differ, because dataset.md describes
# my Destatis table 12411-0003 (56 data rows, 7 columns in the table CSV), but this
# script downloads the Cologne bike counts 2022 (13 lines = header + 12 months,
# 18 columns = month + 17 counting stations). The file is ISO-8859-1, not UTF-8,
# so tr needs LC_ALL=C and the first lines are converted with iconv.