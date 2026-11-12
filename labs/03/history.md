# Lab 3 · The history of a dataset

All questions are about `data/co2-mm-mlo.csv` in [datasets/co2-ppm](https://github.com/datasets/co2-ppm).

## 1. Versions

```
$ git log --oneline -- data/co2-mm-mlo.csv | wc -l
      48

$ git log --format="%an" -- data/co2-mm-mlo.csv | sort | uniq -c | sort -nr
  30 github-actions
  15 Soren Jones
   1 subhankar
   1 Luccas Gomes
   1 Joel

$ git log --format="%ad" --date=format:%Y -- data/co2-mm-mlo.csv | sort | uniq -c
  10 2015
   4 2016
   2 2017
  10 2024
  11 2025
  11 2026

$ git show af2c0a6:data/co2-mm-mlo.csv | tail -n 1
2016-12-01,2016.958,404.48,404.48,405.25,29
```

48 commits changed the file. Soren Jones updated it by hand in 2015–2017, subhankar changed the date format in 2017, Joel added automatic updates in 2024, and since then a bot (github-actions) updates it every month. From 2018 to 2023 nobody updated the file: the latest month in it was December 2016.

## 2. The day the data disappeared

```
$ git log --stat --format="%h %ad %an %s" --date=short -- data/co2-mm-mlo.csv | head -12
…
4ae30e8 2026-03-03 Luccas Gomes fix: harden NOAA fetch and restore co2-mm-mlo output
 data/co2-mm-mlo.csv | 815 ++++++++++++++++++++
0c74626 2026-03-01 github-actions Commit from GitHub Actions (Update Data from NOAA)
 data/co2-mm-mlo.csv | 814 --------------------

$ git show 0c74626:data/co2-mm-mlo.csv
Date,Decimal Date,Average,Interpolated,Trend,Number of Days

$ git show 4ae30e8 -- scripts/process.sh
-  curl ftp://aftp.cmdl.noaa.gov/products/trends/co2/$file > tmp/$file
+  curl --fail --silent --show-error --location ftp://aftp.cmdl.noaa.gov/products/trends/co2/$file -o tmp/$file
+  if [ ! -s "tmp/$file" ]; then
+    echo "Download failed or empty file: $file" >&2
+    exit 1
+  fi
```

On 1 March 2026, the bot deleted 814 lines: only the header was left. On that day, my `get_data.sh` would have downloaded a file with a header and no data, without any error. Luccas Gomes repaired it two days later, on 3 March 2026. The repair applies the lesson from lab 2: `curl --fail` stops on an error instead of saving whatever the server sends, and the script now stops if the downloaded file is empty.

## 3. Old numbers change

```
$ git diff 8c40972~1 8c40972 -- data/co2-mm-mlo.csv | grep -c "^+[0-9]"
52
$ git diff 8c40972~1 8c40972 -- data/co2-mm-mlo.csv | grep -c "^-[0-9]"
51

$ git diff --word-diff --word-diff-regex='[^,]+' 8c40972~1 8c40972 -- data/co2-mm-mlo.csv | grep "\[-" | head -3
1982-12,1982.9583,340.78,[-341.70-]{+341.71+},26,0.30,0.11
1993-10,1993.7917,354.23,[-357.60-]{+357.61+},28,0.29,0.11
1995-07,1995.5417,361.78,[-361.10-]{+361.11+},28,0.36,0.13
```

The update added 52 lines and removed 51: it added 1 new month (August 2026) and changed 51 existing months. The oldest month it changed is December 1982. Mostly, the deseasonalized value changed by 0.01. So numbers that I computed from a download in September are no longer exactly the same as with the current file: I must note which version I used.

## 4. A header that no longer fits

```
$ git show 8c40972:data/co2-mm-mlo.csv | head -n 2
Date,Decimal Date,Average,Interpolated,Trend,Number of Days
1958-03,1958.2027,315.71,314.44,-01,-9.99,-0.99

$ git show af2c0a6:data/co2-mm-mlo.csv | head -n 2
Date,Decimal Date,Average,Interpolated,Trend,Number of Days
1958-03-01,1958.208,315.71,315.71,314.62,-1
```

The header has 6 names, but a row in the version of 1 October 2026 has 7 values. In 2017, a row still had 6 values. It has been this way since commit `ed48c9c` (13 February 2024, Joel), which added the automatic updates. On GitHub: the problem is known: issue [#18](https://github.com/datasets/co2-ppm/issues/18) "co2-mm-gl.csv and co2-mm-mlo.csv have incorrect number of header names vs columns", opened by olayway on 4 May. It is still open, and a pull request that would fix it has not been merged yet, so the file of 1 October 2026 still has the problem.

## 5. Pin your version

```
$ git rev-parse 8c40972
8c4097238570147adf6fa97ad357315528dac4c5

$ curl -fsSL https://raw.githubusercontent.com/datasets/co2-ppm/8c4097238570147adf6fa97ad357315528dac4c5/data/co2-mm-mlo.csv | tail -n 1
2026-08,2026.6250,427.55,429.51,17,0.36,0.17

$ git checkout 0c74626
$ wc -l data/co2-mm-mlo.csv
       1 data/co2-mm-mlo.csv
$ git switch main
```

This URL always returns the file as it was on 1 October 2026:
https://raw.githubusercontent.com/datasets/co2-ppm/8c4097238570147adf6fa97ad357315528dac4c5/data/co2-mm-mlo.csv

Between `git checkout` and `git switch main`, Git calls the state "detached HEAD": HEAD points to a commit, not to a branch.

## Which version did we use?

In our project README, we note for each dataset the download date, the URL and, if the data is in Git, the full commit hash, or we use a pinned URL like the one above. If the data comes from a portal without Git, as in lab 1, we note the download date, keep the URL and a checksum of the file in `SOURCES.txt`, as `get_data.sh` does. With the checksum we can tell later whether the source has changed.