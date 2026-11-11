### definitions

commit = saved update

branch = a name which links to a commit (for. ex. "master" or "clean")

HEAD = shows my latest branch (I'm working on)

Merge = puts two branches together 



# Lab 3 · Task 1 · Predict, then run

## Round 1 · A straight line

**My prediction:** 5 commits: the first commit, 3 new commits, and 1 merge commit. A commit is always a new circle, a checkout is not, and a merge joins everything together, so it makes a new circle, too.

**Result:** 4 commits. `git merge clean` did not create a new commit. The tool answered "Fast-forward": nothing new happened on master after clean branched off, so Git just moved master forward to "Parse dates".

**Where the labels point:** master and clean both point to "Parse dates", HEAD points to master.

**What I learned:** A merge only makes a new commit when both branches have new commits.



## Round 2 · Two lines meet

**My prediction:** 3 new commits, so 7 in total: "Plot cyclists per month" on plot, "Describe the data in the README" on master, and a merge commit. This time both branches have new commits, so the merge joins the two lines in a new commit.

**Result:** 7 commits, as predicted.

**Which commit has two parents?** The merge commit. Its parents are "Describe the data in the README" (from master) and "Plot cyclists per month" (from plot).

**Why was this merge not a fast-forward?** Both branches had new commits, so the two lines had split. Git could not just move master forward, it had to join them in a new merge commit.

**What would a tag like v1.0 mark in my project?** A tag is a fixed name for one commit, like a bookmark, and it does not move on. Here v1.0 marks the commit where plot and master are joined, the first complete version. In our project, it could mark the version we hand in for milestone 2 (dataset, 18.12.).



## Round 3 · Two ways back

**My prediction:** 2 new commits ("Delete outliers" and the revert). Then `git reset HEAD~2` goes 2 steps back, so master and HEAD point to the merge commit (v1.0) again, and the 2 new commits are deleted, so 7 commits again.

**Result:** As predicted. `git commit` and `git revert HEAD` added 2 new commits. After `git reset HEAD~2`, master and HEAD point to the merge commit (v1.0) again.

**What did `git revert HEAD` add?** A new commit that does the opposite of "Delete outliers", like a correction in bookkeeping. The old commit stays in the history.

**What did `git reset HEAD~2` change?** It moved master and HEAD 2 commits back, to the merge commit. The 2 commits after it are no longer on any branch.

**Are the dashed commits gone?** No. They are drawn with dashed lines because no branch reaches them, but they still exist. With their hash, I can get them back.

**Which command for commits that are already pushed, and why?** `git revert`, because it only adds a new commit and does not change the history. `git reset` rewrites the history, so my team would have a different history than me.



## Round 4 · Lost and found

**My prediction:** `git commit` makes 1 new commit, "Try a log scale". `git checkout master` makes no new commit, HEAD only moves back to master.


**Result:** As predicted, `git commit` made 1 new commit and `git checkout master` made none.

**What does the line above the graph say after `git checkout v1.0~1`?** It showed a hash (cc480f4, "Describe the data in the README") instead of `HEAD: master`. HEAD pointed directly to a commit and not to a branch. Git calls this "detached HEAD".

**What happens to "Try a log scale" when I switch back to master?** No branch points to it any more, so the tool draws it with dashed lines. It is not gone, but I can only find it with its hash.

**Finding and keeping it:** `git reflog` lists every move of HEAD, the newest first. The line `HEAD@{0} checkout: moving from 4054e7a to master` shows the hash of "Try a log scale": 4054e7a. With `git branch logscale 4054e7a`, a branch points to it again, and it is no longer dashed.