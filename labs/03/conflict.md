```
<<<<<<< HEAD
name,iso3,iso2,numeric
Czech Republic,CZE,CZ,203
Germany,DEU,DE,276
Macedonia,MKD,MK,807
Swaziland,SWZ,SZ,748
Turkey,TUR,TR,792
=======
name,iso3,iso2
Czechia,CZE,CZ
Germany,DEU,DE
North Macedonia,MKD,MK
Eswatini,SWZ,SZ
Türkiye,TUR,TR
>>>>>>> feature/new-names
```


## What a program would see

```
$ cut -d, -f1 countries.csv
<<<<<<< HEAD
name
Czech Republic
Germany
Macedonia
Swaziland
Turkey
=======
name
Czechia
Germany
North Macedonia
Eswatini
Türkiye
>>>>>>> feature/new-names
```

A program that reads this CSV file would see the marker lines as countries, two headers, ten countries instead of five, Germany twice, and old and new names mixed.

## After the merge

```
$ git log --oneline --graph -8
*   db379a2 Merge branch 'feature/new-names'
|\  
| * 00e85c5 Use current country names
* | ae211c5 Add ISO numeric codes
|/  
* d63c346 Add ISO 2 codes
* 1000dd5 Add country names with ISO 3 codes
* 9a0af87 Add AI usage entry for lab 3, tasks 4
* f0e5bc3 Record the undo exercises for lab 3, task 4
* e62c183 Revert "Change the download year"
```

**The two branches changed different columns, so why did Git report a conflict?** Git does not know columns. It compares a file line by line. On `main`, I added `numeric` at the end of every line, and on the branch, I changed the name at the start of four lines. So both branches changed the same lines, and Git cannot decide which version of a line is right.

**Why are Germany and the header part of the conflict, although only one branch changed them?** On `main`, adding the column changed every line, also the header and Germany. Their neighbours were changed on both branches. Git puts changed lines that are next to each other into one block, so the whole table became one conflict.

**How could our team avoid conflicts like this one in a shared data file?** Agree on who changes a data file and when, and do not change the same file on two branches at the same time. Merge small changes often and run `git pull` before starting to work. Better still, do not edit data tables by hand: let a script build them, so that only the script changes.