# Dataset profile

## Task 5 · Find a dataset

### Where I searched

| Source | Kind | Search terms | What I found |
|---|---|---|---|
| [FFA Filmförderungsanstalt](https://www.ffa.de/broschueren.html) | publisher website | Kinojahr, Kinobesucher | Cinema tickets, revenue and audience 2000–2025, but only as PDF and without an open licence |
| [GENESIS-Online (Destatis)](https://genesis.destatis.de) | national statistics database | Fortschreibung des Bevölkerungsstandes | Population of Germany per year, as CSV under an open licence |
| [GovData](https://www.govdata.de) | national open data portal | kino | 133 datasets, see below |
| [Open.NRW](https://open.nrw) | state open data portal | kino | 33 datasets, see below |

### Search like a machine

| API | Hits (`count`) | Title of the first hit | Where the licence is given |
|---|---|---|---|
| [GovData](https://www.govdata.de/ckan/api/3/action/package_search?q=kino&rows=1) | 133 | Kino (Stadt Norderstedt) | `license_id` for the whole dataset is empty, but each file has `license` = Datenlizenz Deutschland – Namensnennung 2.0. Also, `isopen` is `false` although the files are openly licensed, so the field is not reliable. |
| [Open.NRW](https://open.nrw/api/3/action/package_search?q=kino&rows=1) | 33 | POI – Kinos (Regionalverband Ruhr) | `license_id` for the whole dataset: `other-closed` ("Andere geschlossene Lizenz"), so the data is not open. |

Searched on 24.10.2026. Both first hits are about cinema locations, not cinema visits, so they do not fit our research questions.

### My choice

I chose **Bevölkerung: Deutschland, Stichtag (12411-0001)** from [Destatis](https://genesis.destatis.de/datenbank/online/statistic/12411/table/12411-0001). Destatis is the original publisher, the data can be downloaded as CSV, and it is under an open licence. The cinema data of the FFA would fit our topic better, but it is only available as PDF and not openly licensed, so it cannot be the base of an open dataset.

## Task 6 · Profile the dataset

## Task 7 · FAIR review

## Task 8 · Plan what to combine it with
