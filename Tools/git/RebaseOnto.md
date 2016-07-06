# Rebase Onto

Using `git rebase --onto` is a good way to cherry-pick an entire branch onto the
current working branch.

Example command:

```
git rebase --onto branch-with-feature 
991e925c7b45c15f156e2ef9af1d53d1f8df929e
```

The first argument is the branch from which we want to pick the commits. The
second argument is the commit SHA of a commit on the current working branch onto
which we want replay the commits from the branch we're picking from.

This allows us to insert the commits from the feature branch at an arbitrary
point in our working branch.
