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

I chose **Bevölkerung: Deutschland, Stichtag, Geschlecht (12411-0003)** from [Destatis](https://genesis.destatis.de/datenbank/online/statistic/12411/table/12411-0003). Destatis is the original publisher, the data can be downloaded as CSV, and it is under an open licence. It contains the total population per year (which we need to calculate cinema visits per person) and the population by sex. A shorter table with the total only also exists ([12411-0001](https://genesis.destatis.de/datenbank/online/statistic/12411/table/12411-0001), from 1950).

The cinema data of the FFA would fit our topic better, but it is only available as PDF and not openly licensed, so it cannot be the base of an open dataset.

## Task 6 · Profile the dataset

### Facts

| | Bevölkerung: Deutschland, Stichtag, Geschlecht |
|---|---|
| Publisher | Statistisches Bundesamt (Destatis), original publisher, on [GENESIS-Online](https://genesis.destatis.de) |
| Identifier | Table `12411-0003`, statistic `12411` (Fortschreibung des Bevölkerungsstandes) |
| Formats | CSV (table layout) and flat CSV (one value per row), each as ZIP download |
| Size | Table CSV: 1 file, 56 data rows (years), 7 columns (date, then value and quality flag for male, female, total). Flat CSV: 1 file, 168 rows (56 years × 3), 18 columns |
| Coverage | Germany, 31.12.1970 to 31.12.2025, one value per year (reference date 31 December), by sex |
| Last update | "Stand: 22.10.2026" in the file; updated once a year |
| Licence | [Datenlizenz Deutschland – Namensnennung – Version 2.0](https://www.govdata.de/dl-de/by-2-0) (GENESIS-Online → Impressum → Copyright) |

### Stars

★★★ The data is openly licensed (★), structured and machine-readable (★★) and in a non-proprietary format, CSV (★★★). For the 4th star, the data would need URIs that identify things, e.g. a link for "Germany" or "male" instead of plain text, so that others can point to it.

### Open the data

I downloaded both CSV files and opened them in Microsoft Excel.

| Column | Minimum | Maximum | Mean |
|---|---|---|---|
| male | 29,071,621 (1970) | 41,241,701 (2024) | 36,349,261 |
| female | 31,818,689 (1987) | 42,335,439 (2024) | 38,399,631 |
| total | 61,001,164 (1970) | 83,577,140 (2024) | 74,748,892 |

**Empty cells:** in the flat CSV, the column `2_variable_attribute_code` is empty in 56 of 168 rows, always in the rows for "Insgesamt" (total). In the table CSV, no data cell is empty.

**Odd things I noticed:**
- The file is UTF-8 with a BOM, uses `;` as separator and has no decimal numbers.
- The table CSV starts with 7 lines of titles before the data and ends with footnotes and a copyright line, so it cannot be read as a plain table. The flat CSV has one clean header row.
- Dates are written as `31.12.1970` in the table CSV and as `1970-12-31` (ISO 8601) in the flat CSV. The flat CSV is not sorted by year.
- Each value has a quality flag; all flags are `e`.
- **Breaks in the series:** until 1989 the numbers cover only West Germany ("Bis 1989: Früheres Bundesgebiet"), so the total jumps from 62.7 million (1989) to 79.8 million (1990). After the census 2011 the total drops from 81.8 million (2010) to 80.3 million (2011); the census 2022 also changes the basis.
- male + female = total in every row.

### Data dictionary (flat CSV)

| Column | Meaning | Type and unit | Example |
|---|---|---|---|
| `time` | Reference date | date (ISO 8601) | `2025-12-31` |
| `1_variable_attribute_label` | Area | text | `Deutschland` |
| `2_variable_attribute_label` | Sex | text: `männlich`, `weiblich`, `Insgesamt` | `weiblich` |
| `value` | Population | integer, number of persons | `42282795` |
| `value_q` | Quality flag of the value | text code | `e` |

Destatis explains the statistic and its method on the [statistic page in GENESIS-Online](https://genesis.destatis.de/datenbank/online/statistic/12411/details). There is no separate description of each column; the column names of the flat CSV are mostly self-explanatory, but codes such as `DINSG` or `e` need the GENESIS documentation.

### Licence

The Datenlizenz Deutschland – Namensnennung – Version 2.0 [conforms to the Open Definition](https://opendefinition.org/licenses/), so the dataset is open. When I reuse it, I must name the provider, the licence and a link to the dataset, and say if I changed the data.

**Attribution (TASL):**

> „Bevölkerung: Deutschland, Stichtag, Geschlecht (12411-0003)“, Statistisches Bundesamt (Destatis), [GENESIS-Online](https://genesis.destatis.de/datenbank/online/statistic/12411/table/12411-0003), [Datenlizenz Deutschland – Namensnennung – Version 2.0](https://www.govdata.de/dl-de/by-2-0). Data changed: filtered to 2000–2025.

### People

The dataset contains no personal data: it only has totals for all of Germany per year and sex.

## Task 7 · FAIR review

## Task 8 · Plan what to combine it with
