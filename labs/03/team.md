# Lab 3 · Our roadmap, through pull requests

Team repository: [chaymaeloukili/data-integration-projekt](https://github.com/chaymaeloukili/data-integration-projekt) (I worked with Ülkü Arslan)

- My issue: [#3 Add team rules to the README](https://github.com/chaymaeloukili/data-integration-projekt/issues/3)
- My pull request: [#1 Add team rules to the README](https://github.com/chaymaeloukili/data-integration-projekt/pull/1)
- The pull request I reviewed: [#4 Explain how to get the data](https://github.com/chaymaeloukili/data-integration-projekt/pull/4) by Ülkü

```
$ git log --oneline --graph -15
*   d7d39a1 (HEAD -> main, origin/main, origin/HEAD) Merge pull request #4 from chaymaeloukili/feature/2-get-the-data
|\  
| *   fd533ea Merge branch 'main' into feature/2-get-the-data
| |\  
| |/  
|/|   
* |   03517ac Merge pull request #1 from chaymaeloukili/feature/1-team-rules
|\ \  
| * | 1b09c74 (origin/feature/1-team-rules) Add team rules to the README
|/ /  
| * 4c88ac7 (origin/feature/2-get-the-data) Explain how to get the data
|/  
* f8f8514 Update liste_ergeinisse.md
* 1dd015c Translate timeline document to English
* affc777 Update README with project details and data sources
* c1c4900 Create README.md
* 0b4e19f Create README.md
* 2372b7f Create README.md
* 473310c Create README.md
* efd5cc5 Create README.md
* ef9b946 Create README.md
* 23e1630 Update README with project steps and folder details
```

In my review of #4, I commented on the line with the data sources: "The links work, and the table number matches our Data sources table." Then I approved it, and after Ülkü had resolved the conflict, I checked again that both sections were in the README and no conflict markers were left. I had no conflict to resolve myself, because my pull request #1 was merged first. Ülkü's pull request #4 then had a conflict, because both of us had added a section at the end of the README; she merged `main` into her branch and kept both sections (commit `fd533ea`). As a team, we agree that nobody pushes to `main`: every change comes as a pull request on its own branch, and a teammate reviews it before it is merged.