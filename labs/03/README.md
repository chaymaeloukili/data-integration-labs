# Lab 3 · Version Control

This folder contains my work for lab 3:

- `graph.md` and `git-graph.png`: my predictions for the commit graphs (task 1)
- `git.md`: my answers about Git (tasks 2 and 3)
- `get_data.sh`: the script that downloads the raw data
- `.gitignore`: keeps the raw data in `data/raw/` out of the repository

## How to rebuild the raw data

The folder `data/raw/` is not in the repository. Anyone can rebuild it with the script:

```bash
cd labs/03
./get_data.sh
```

The script creates `data/raw/`, downloads the file `koeln_2022.csv`, adds a line to `data/raw/SOURCES.txt` and prints a first look and a checksum of the file.

**Source:** "Fahrrad-Verkehrsdaten Köln 2022", Stadt Köln, [Offene Daten Köln](https://www.offenedaten-koeln.de/dataset/fahrrad-verkehrsdaten-koeln-2022)

**Licence:** [Datenlizenz Deutschland – Zero – Version 2.0](https://www.govdata.de/dl-de/zero-2-0)


The download takes only a few seconds, because the file is small (about 2 KB).