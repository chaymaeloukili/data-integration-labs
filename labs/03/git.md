# Lab 3 · Version Control

## Setup

### Read your history

```
$ ls -a
.               .git            LICENSE         labs
..              AI_USAGE.md     README.md

$ git status
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean

$ git remote -v
origin  https://github.com/chaymaeloukili/data-integration-labs.git (fetch)
origin  https://github.com/chaymaeloukili/data-integration-labs.git (push)
```

### How many commits, and where did I make them?

```
$ git log --oneline | wc -l
      33

$ git log --format="%cn" | sort | uniq -c
  32 GitHub
   1 chaymaeloukili
```

My repository has 33 commits. I made 32 of them in the browser on GitHub (GitHub is the committer), and only 1 on my computer with `git commit` (Task 2, step 6).

### Commit messages written by GitHub

```
$ git log --format="%s" | sort | uniq -c | sort -nr | head -5
   5 Add files via upload
   2 Update AI_USAGE.md
   1 Update pitfalls section with specific issues and fixes
   1 Update dataset.md
   1 Revise labels and section descriptions in cheatsheet

$ git log --format="%h %ad %s" --date=short | grep "AI_USAGE"
135b884 2026-11-05 Update AI_USAGE.md
0ce053d 2026-10-24 Update AI_USAGE.md
```

"Add files via upload" and "Update AI_USAGE.md" do not say what changed. Both "Update AI_USAGE.md" commits even have the same message, although I added entries for lab 1 in one and for lab 2 in the other. Better messages:

| Commit | Message by GitHub | Better message |
|---|---|---|
| `1cb2ca0` | Add files via upload | Add download script get_data.sh and its output (lab 2, task 4) |
| `135b884` | Update AI_USAGE.md | Add AI usage entries for lab 2 to AI_USAGE.md |

### Which e-mail address do my commits carry?

```
$ git log --format="%h %ae %s" | head -5
58305b5 311860801+chaymaeloukili@users.noreply.github.com Add commit graph predictions and screenshot (lab 3, task 1)
70b96cd 311860801+chaymaeloukili@users.noreply.github.com Delete labs/03
fb9bb11 311860801+chaymaeloukili@users.noreply.github.com Create 03
4345358 311860801+chaymaeloukili@users.noreply.github.com Add entry for Lab 02, Task 5 with command explanations
276fc14 311860801+chaymaeloukili@users.noreply.github.com Add files via upload

$ git log --format="%ae" | sort | uniq -c
  33 311860801+chaymaeloukili@users.noreply.github.com
```

All 33 commits carry my `noreply` address, so my private address is not public. Step 1 (keep my e-mail private, block pushes that expose it) protects all future commits. It cannot change commits that were already pushed: their address stays in every clone of the repository.

### Which files did I change most often?

```
$ git log --name-only --format="" | sort | uniq -c | sort -nr | head -5
   7 AI_USAGE.md
   6 labs/01/dataset.md
   4 labs/01/cheatsheet.md
   2 labs/03
   2 labs/02/bashcrawl.log
```

I changed `AI_USAGE.md` most often, because I add an entry after every lab. `labs/03` appears twice because I created a file `03` by mistake and deleted it again.

### My first commit from my computer

Before the push:

```
$ git status
On branch main
Your branch is ahead of 'origin/main' by 1 commit.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
```

After the push:

```
$ git status
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```

Before the push, my computer had 1 commit that GitHub did not have yet. After the push, both are at the same state. My avatar is shown next to the commit on GitHub, because the commit carries my `noreply` address.


## Step by step

```
$ git log --oneline -- .
3c38b4d Explain how to rebuild the data
9e1dc27 Print a checksum of the downloaded file
de14aca Explain where to run the script and where the data goes
25333de Ignore downloaded raw data
5c6a0d9 Copy the download script from lab 2
bb5c87d Answer setup questions for lab 3, task 2
58305b5 Add commit graph predictions and screenshot (lab 3, task 1)
70b96cd Delete labs/03
fb9bb11 Create 03

$ git status --ignored
On branch main
Your branch is up to date with 'origin/main'.

Ignored files:
  (use "git add -f <file>..." to include in what will be committed)
	data/

nothing to commit, working tree clean
```

**Why does the `.gitignore` belong in the repository, but `data/raw/` does not?** The `.gitignore` is a small text file with a rule. Everyone who clones the repository needs this rule, so that nobody commits the raw data by mistake. `data/raw/` contains downloaded data: it can be large, it can change at the source, and it can be rebuilt at any time with `get_data.sh`. Git is made for text that people write, like scripts and notes, not for data that a script downloads.

**What does a teammate need to get my raw data?** They clone the repository and run `./get_data.sh` in `labs/03`, as described in `labs/03/README.md`. The script stores the source in `data/raw/SOURCES.txt` and prints a checksum, so they can check if they got the same file as me.