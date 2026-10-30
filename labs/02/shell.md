# Lab 2 · Shell

## Task 1 · Get to know your shell

### Which shell?
```
$ echo $0
-zsh
$ zsh --version
zsh 5.9 (arm64-apple-darwin25.0)
```
My terminal uses the zsh shell in version 5.9.

echo $0 = shows the name of the shell that is running
zsh --version = shows the version of the shell

### Where am I?
```
$ cd ~
$ pwd
/Users/<user>
$ cd ~/Downloads
$ pwd
/Users/<user>/Downloads
```
My home directory is /Users/<user> and my downloads folder is /Users/<user>/Downloads.

~ = my home directory
cd = change directory, move into a folder
pwd = print working directory, shows the absolute path of where I am

### Where do commands come from?
```
$ echo $PATH | tr ':' '\n'
/Users/<user>/.local/bin
/opt/anaconda3/bin
/opt/anaconda3/condabin
/Library/Frameworks/Python.framework/Versions/3.14/bin
/usr/local/bin
/System/Cryptexes/App/usr/bin
/usr/bin
/bin
/usr/sbin
/sbin
/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin
/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin
/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin
/pkg/env/global/bin
$ echo $PATH | tr ':' '\n' | wc -l
      14
$ which curl python3 git
/opt/anaconda3/bin/curl
/opt/anaconda3/bin/python3
/usr/bin/git
$ git --version
git version 2.50.1 (Apple Git-155)
```
My PATH has 14 directories and /Users/<user>/.local/bin is searched first. curl and python3 come from Anaconda, because Anaconda is earlier in the PATH than /usr/bin. git is installed in /usr/bin (version 2.50.1).

$PATH = a list with many folders where the shell is searching when I type a command, the first match wins
tr ':' '\n' = replaces every : with a newline, so each folder gets its own line
| = the pipe, the output of the first command goes to the next one
wc -l = counts the lines (how many folders are in the PATH)
which = shows where a program is installed
git --version = checks if git is installed

### How full is your disk?
```
$ df -h ~
Filesystem      Size    Used   Avail Capacity  Mounted on
/dev/disk2s5   228Gi   169Gi    33Gi    84%    /System/Volumes/Data
$ du -sh ~/Downloads
1,2G	/Users/<user>/Downloads
```
On my disk 33 GB of 228 GB are still free (84 % used), my downloads folder takes 1,2 GB.

df -h = disk free, shows how much space is left, -h = human readable (GB)
du -sh = disk usage, shows how big a folder is, -s = only the sum

### Stop a runaway process
Window 1:
```
$ sleep 600
zsh: terminated  sleep 600
```
Window 2:
```
$ ps aux | grep sleep
<user>   36242   0,0  0,0 410059936    192 s001  R+    4:52   0:00.00 grep sleep
<user>   36029   0,0  0,0 435299744    512 s000  S+    4:51   0:00.00 sleep 600
$ kill 36029
```
The first window shows "zsh: terminated sleep 600", the process was stopped from outside and I can type again. ps aux | grep sleep lists two processes, because the search command grep sleep is also running and has the word "sleep" in it, so it finds itself.

sleep 600 = does nothing for 600 seconds, like a script that hangs
ps aux = lists all running processes, the second column is the process ID (PID)
kill <PID> = stops the process with this number

## Task 2 · bashcrawl

### Start
```
$ cd ~/DIS3.3_Lab/Lab2
$ curl -L -O https://gitlab.com/slackermedia/bashcrawl/-/archive/master/bashcrawl-master.zip
$ unzip -q bashcrawl-master.zip
$ cd bashcrawl-master/entrance
$ cat scroll
```
curl -L -O <link> = downloads a file, -L follows redirects, -O saves it with the original name
unzip -q = unpacks the zip file without long output
ls = shows what is in the room (folder)
cat = shows the text of a file, every scroll teaches a new spell (command)
cd .. = go one room back

### My inventory at the end
```
$ echo $I
hair,bracelet,sword,amulet,
```
At the end of the game I have the hair, the bracelet, the sword and the amulet.

### Three commands I learned in the game (not in the lecture)

**export**
```
$ export I=sword,$I
```
export = creates or changes a variable, here I is my inventory and ,$I keeps everything that was already in it.

**ln -s**
```
$ ln -s ../../../../.rift portal
```
ln -s = creates a symbolic link, a shortcut to another folder, so I can go there with cd portal.

**mv**
```
$ mv drum wizard-dark
```
mv = moves or renames a file, here I renamed the drum so the drumming stopped and the monster got weaker.

Other new ones: ls -F (marks folders with / and programs with *), alias (gives a command a short name), ./name (runs a program in the current folder).

### Monster vs. scroll
In the pit, the room of the monster nyarlathotep:
```
$ ls -l
total 40
-rw-r--r--@ 1 <user>  staff    47 May 24 00:21 drum
-rwxr-xr-x@ 1 <user>  staff  1279 May 24 00:21 drummer*
-rwxr-xr-x@ 1 <user>  staff  4021 May 24 00:21 nyarlathotep*
-rw-r--r--@ 1 <user>  staff   154 May 24 00:21 scroll
-rwxr-xr-x@ 1 <user>  staff  1231 May 24 00:21 wizard-light*
```
The monster nyarlathotep has an x in its rights (-rwxr-xr-x), that means it is executable, a program I can run with ./nyarlathotep. The scroll has no x (-rw-r--r--), it is only a text file that I can read with cat.
