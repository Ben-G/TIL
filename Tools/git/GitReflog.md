#Use Git Reflog to Undo Bad Rebase

Recently I messed up a `git rebase` and rewrote my branch incorrectly. Luckily git allows us to undo almost any operation.

To undo a rebase, the git `reflog` (short for reference log) is very handy. It stores the history of how `HEAD` changed (among other reference changes).

As this [Stack Overflow](http://stackoverflow.com/questions/134882/undoing-a-git-rebase) answer desribes, `git reflog` can be used together with `git reset` to recover a previous state of a branch:

```
git reflog
# Suppose the old commit was HEAD@{5} in the ref log
git reset --hard HEAD@{5}

```

As usual we need to be careful with the `--hard` option, since it can be painful to try to recover changes lost through an incorrect hard reset...