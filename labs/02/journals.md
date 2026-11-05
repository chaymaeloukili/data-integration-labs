# Lab 2 · Task 3 · Journal articles

## 1. Shape

head -n 1 = takes the first line (headline) with the column titel

tr "\t" "\n" = replaces the tab with a line break (so every colomn name has his own line)

cat -n = give numbers for each line


### Column names

```bash
head -n 1 2014-01_JA.tsv | tr "\t" "\n" | cat -n
```

```
     1	File
     2	Creator
     3	Issue
     4	Volume
     5	Journal
     6	ISSN
     7	ID
     8	Citation
     9	Title
    10	Place Labe
    11	Language
    12	Publisher
    13	Date
```

The file has 13 columns. Column 10 is cut off: `Place Labe` should probably be `Place Label`.

### Same header in all four files?

Input:

```bash
for f in *.tsv; do head -n 1 "$f"; done | sort | uniq -c
```

Output:

```
   4 File	Creator	Issue	Volume	Journal	ISSN	ID	Citation	Title	Place Labe	Language	Publisher	Date
```

- `for f in *.tsv; do … done` = a loop, goes through all four .tsv files one by one (`f` = name of the current file)
- `head -n 1 "$f"` = takes the first line (the header) of every file
- `sort | uniq -c` = puts the same lines together and counts how often each line repeats

Answer: There is only one line with a 4 in front, so all four TSV files have the same header.

### Number of articles per file

Input:

```bash
wc -l *.tsv
```

Output:

```
   13712 2014-01-31_JA-africa.tsv
   27392 2014-01-31_JA-america.tsv
  507732 2014-01_JA.tsv
    5375 2014-02-02_JA-britain.tsv
  554211 total
```

- `wc -l` = word count, `-l` = counts only the lines of every file

Answer: The first line of every file is the header and not an article, so it is lines minus 1: 2014-01_JA.tsv has 507,731 articles, the America file 27,391, the Africa file 13,711 and the Britain file 5,374.


## 2. Missing values

Input:

```bash
cut -f 11 2014-01_JA.tsv | tail -n +2 | sort | uniq -c | sort -nr
```

Output:

```
403284 eng
 40155 fre
 36100 
 28192 ger
```

- `cut -f 11` = takes only column 11 (Language)
- `tail -n +2` = starts at line 2, so the header is not counted
- `sort | uniq -c` = counts how often every language appears
- `sort -nr` = sorts by number (`n`), biggest first (`r` = reverse)

Answer: 36,100 articles have no language (the line with nothing after the number). There are three languages: English (403,284), French (40,155) and German (28,192). Together with the empty ones, this is 507,731, so every article is counted.


## 3. Years

### Year with the most articles

Input:

```bash
cut -f 13 2014-01_JA.tsv | tail -n +2 | cut -c 1-4 | sort | uniq -c | sort -nr | head
```

Output:

```
30813 1997
28215 1998
27968 1996
27916 2002
27335 2001
27073 1999
26266 2003
26129 2005
26117 2000
25831 2008
```

- `cut -f 13` = takes only column 13 (Date)
- `cut -c 1-4` = takes only the characters 1 to 4, so only the year
- `head` = shows only the first 10 lines

Answer: 1997 has the most articles (30,813).


### Year that cannot be right

Input:

```bash
cut -f 13 2014-01_JA.tsv | tail -n +2 | cut -c 1-4 | sort | uniq -c | tail -5
```

Output:

```
24912 2010
24788 2011
21804 2012
 8430 2013
   20 2077
```

- without `sort -nr`, the years stay sorted by year, so the latest years are at the end
- `tail -5` = shows only the last 5 lines

Answer: 2077 cannot be right, because the data is from 2014 and 2077 is in the future. 20 articles have this year.

### Which journal?

Input:

```bash
cut -f 5,13 2014-01_JA.tsv | grep "2077" | sort | uniq -c
```

Output:

```
  20 FRANCAIS DANS LE MONDE	2077
```

- `cut -f 5,13` = takes two columns: 5 (Journal) and 13 (Date)
- `grep "2077"` = keeps only the lines with 2077

Answer: All 20 articles come from the journal FRANCAIS DANS LE MONDE.

### Which year was meant?

Input:

```bash
cut -f 8 2014-01_JA.tsv | grep "FRANCAIS DANS LE MONDE .*(SUPP)" | cut -d "(" -f 1,3 | sort | uniq -c
```

Output:

```
  21 FRANCAIS DANS LE MONDE 317(2001)
  22 FRANCAIS DANS LE MONDE 319(2002)
  19 FRANCAIS DANS LE MONDE 333(2004)
  19 FRANCAIS DANS LE MONDE 342(2005)
  20 FRANCAIS DANS LE MONDE 344(2006)
  20 FRANCAIS DANS LE MONDE 351(2007)
  20 FRANCAIS DANS LE MONDE 353(2077)
  18 FRANCAIS DANS LE MONDE 357(2008)
  16 FRANCAIS DANS LE MONDE 360(2008)
  19 FRANCAIS DANS LE MONDE 362(2009)
  11 FRANCAIS DANS LE MONDE 369(2010)
  12 FRANCAIS DANS LE MONDE 370(2010)
  13 FRANCAIS DANS LE MONDE 374(2011)
  16 FRANCAIS DANS LE MONDE 376(2011)
  16 FRANCAIS DANS LE MONDE 378(2011)
  17 FRANCAIS DANS LE MONDE 380(2012)
  17 FRANCAIS DANS LE MONDE 382(2012)
  15 FRANCAIS DANS LE MONDE 386(2013)
```

- `cut -f 8` = takes only column 8 (Citation)
- `grep "FRANCAIS DANS LE MONDE .*(SUPP)"` = keeps only the supplements (SUPP) of this journal, `.*` = any characters
- `cut -d "(" -f 1,3` = cuts the line at every `(` and keeps part 1 (journal + issue) and part 3 (year), `-d` = which character separates the parts

Answer: All 20 articles are in the supplement of issue 353. The issue numbers go up with the years: issue 351 is from 2007 and issue 357 is from 2008, so 353 is probably from 2007. Somebody typed 2077 instead of 2007.

## 4. Lines are not fields

Input:

```bash
grep -ic africa 2014-01_JA.tsv
```

Output:

```
33577
```

Input:

```bash
cut -f 9 2014-01_JA.tsv | grep -ic africa
```

Output:

```
13711
```

Input:

```bash
grep -i africa 2014-01_JA.tsv | cut -f 5 | sort | uniq -c | sort -nr | head -5
```

Output:

```
3887 WEST AFRICA
2828 BULLETIN- SCHOOL OF ORIENTAL AND AFRICAN STUDIES UNIVERSITY OF LONDON
2562 INTERNATIONAL JOURNAL OF AFRICAN HISTORICAL STUDIES
1823 JOURNAL OF AFRICAN HISTORY
1458 JOURNAL OF MODERN AFRICAN STUDIES
```

- `grep -i` = searches without caring about upper or lower case
- `-c` = count, counts the lines instead of showing them
- `cut -f 9` = takes only column 9 (Title), so grep searches only in the title

Answer: 33,577 lines contain "africa", but only 13,711 titles do. grep searches the whole line, so it also finds "africa" in other columns, mostly in the journal name (for example JOURNAL OF AFRICAN HISTORY). It also finds "african", because "africa" is inside this word. 19,866 lines have "africa" only outside the title.

## 5. Where does a file come from?

### Africa

Input:

```bash
cut -f 9 2014-01_JA.tsv | grep -ic africa
wc -l 2014-01-31_JA-africa.tsv
cut -f 9 2014-01-31_JA-africa.tsv | grep -vic africa
```

Output:

```
13711
   13712 2014-01-31_JA-africa.tsv
1
```

### America

Input:

```bash
cut -f 9 2014-01_JA.tsv | grep -ic america
wc -l 2014-01-31_JA-america.tsv
cut -f 9 2014-01-31_JA-america.tsv | grep -vic america
```

Output:

```
27391
   27392 2014-01-31_JA-america.tsv
1
```

- first command = how many titles in the big file contain the word
- `wc -l` = how many lines the small file has (articles + 1 header)
- `grep -v` = the opposite, counts the lines WITHOUT the word

Answer: The claim holds for both files. The big file has 13,711 titles with "africa", and the Africa file has 13,712 lines, so 13,711 articles plus the header. Only 1 title in the Africa file has no "africa", and that is the header ("Title"). It is the same for America: 27,391 titles in the big file and 27,391 articles in the America file, and only the header has no "america".


## 6. Spreadsheet damage

### Most frequent values of the Issue column

Input:

```bash
cut -f 3 2014-01_JA.tsv | sort | uniq -c | sort -nr | head -20
```

Output:

```
99743 1
96514 2
75421 3
58325 4
30668 
9650 5
5325 6
4219 01-Feb
3157 03-Apr
2736 7
2077 8
2035 10
2009 12
1965 11
1829 9
1731 02-Mar
793 SUM
781 AUT
732 WIN
707 SPR
```

### Compare with the Citation column

Input:

```bash
cut -f 3,8 2014-01_JA.tsv | grep "^01-Feb" | head -3
cut -f 3,8 2014-01_JA.tsv | grep "^03-Apr" | head -3
```

Output:

```
01-Feb	WASHINGTON MONTHLY 28(1/2), 4-9. (1996)
01-Feb	WASHINGTON MONTHLY 28(1/2), 9-16. (1996)
01-Feb	WASHINGTON MONTHLY 28(1/2), 17-25. (1996)
03-Apr	INTERNATIONALES ASIENFORUM 26(3/4), 233-248. (1995)
03-Apr	INTERNATIONALES ASIENFORUM 26(3/4), 249-285. (1995)
03-Apr	INTERNATIONALES ASIENFORUM 26(3/4), 285-302. (1995)
```

### How many rows are affected?

Input:

```bash
cut -f 3 2014-01_JA.tsv | grep -cE '^[0-9][0-9]-[A-Z][a-z][a-z]$'
```

Output:

```
11632
```

- `cut -f 3,8` = takes Issue and Citation next to each other
- `^` = at the beginning of the line, `$` = at the end
- `-E` = extended pattern, `[0-9][0-9]` = two digits, `[A-Z][a-z][a-z]` = a month like Feb

Answer: 01-Feb, 03-Apr and 02-Mar are not issue numbers, they look like dates. SUM, AUT, WIN and SPR are not numbers either, but they are seasons (summer, autumn, winter, spring), which some journals use as issue names. The Citation shows what happened: the real issue is 1/2 or 3/4 (a double issue). The file was opened in a spreadsheet program like Excel, and it turned 1/2 into the date 1 February (01-Feb) and 3/4 into 3 April (03-Apr). 11,632 rows are affected.

