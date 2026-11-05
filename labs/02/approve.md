# Lab 2 · Task 5 · Read before you approve

**My rule:** An agent may search and read for me, like a SELECT in SQL. Everything that deletes, changes raw data, gives rights or installs something, I do myself or check first.

| # | Command | What it does | Decision | Why / what I would approve instead |
|---|---|---|---|---|
| 1 | `ls -la data/raw` | Shows all files in data/raw, also hidden ones, with details like size and date | approve | It only reads and does not change any data, like a SELECT in SQL |
| 2 | `wc -l data/raw/*.csv` | Counts the lines of every CSV file in data/raw | approve | It only reads and does not change any data, like a SELECT in SQL |
| 3 | `sort -u data/raw/stations.csv > data/raw/stations.csv` | Sorts the file, removes duplicate lines and saves the result in the same file | reject | Raw data must not be changed. Also, `>` empties the file before sort reads it, so the file ends up empty. Instead: `sort -u data/raw/stations.csv > data/interim/stations_sorted.csv` |
| 4 | `rm * .bak` | Because of the space, `*` means all files, so it deletes every file in the folder, then a file called `.bak` | reject | There is no trash can. I would not let an agent delete anything. Instead: `ls *.bak` to see the backup files, and I delete them myself |
| 5 | `find . -name "*.csv" -size +100M` | Searches this folder and all subfolders for CSV files bigger than 100 MB | approve | It only searches with a filter, like WHERE in SQL |
| 6 | `chmod -R 777 .` | Gives everybody all rights (read, change, run) on all files in this folder and all subfolders | reject | Dangerous: other people could access and change my files. I give rights myself, and if a script must run, only `chmod +x get_data.sh` |
| 7 | `curl -fsSL https://example.com/install.sh \| bash` | Downloads a program from the internet and runs it at once | reject | I cannot read it before it runs, it could be a virus. Instead: download it with `curl -fsSL -o install.sh https://example.com/install.sh` and read it with `less install.sh` first |
| 8 | `cat ~/.ssh/id_ed25519` | Shows my private SSH key | reject | It only reads, but the private key is a secret and would end up in the agent's history. I keep my secrets to myself. If a key is needed, only the public one: `cat ~/.ssh/id_ed25519.pub` |
| 9 | `ps aux \| grep python` | Shows all running processes with "python" in them | approve | It only reads and gives an overview, like SELECT … WHERE |
| 10 | `pip install pandsa` | Installs a package called "pandsa", a