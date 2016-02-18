#Assume Unchanged in Git

When adding hiding API Keys or other sensitive information from an open source project I want to add template files without the correct credentials to git, but not track / commit any further updates to these files.

Recently I did that, but mistakenly untracked the file for which I wanted to ignore updates, thus [deleting it from the repository](https://github.com/ReSwift/GitHubBrowserExample/issues/1).

TIL that I should instead set a flag in git's index:

```
git update-index --assume-unchanged SwiftFlowGitHubBrowser/GitHubAuth/Credentials.swift
```

This will ignore any further updates to the file; while the file itself will remain in the working copy and the repository.

The [git docs](https://git-scm.com/docs/git-update-index) provide a good description of this feature:


> `--[no-]assume-unchanged`
When this flag is specified, the object names recorded for the paths are not updated. Instead, this option sets/unsets the "assume unchanged" bit for the paths. When the "assume unchanged" bit is on, the user promises not to change the file and allows Git to assume that the working tree file matches what is recorded in the index. If you want to change the working tree file, you need to unset the bit to tell Git. This is sometimes helpful when working with a big project on a filesystem that has very slow lstat(2) system call (e.g. cifs).
>
Git will fail (gracefully) in case it needs to modify this file in the index e.g. when merging in a commit; thus, in case the assumed-untracked file is changed upstream, you will need to handle the situation manually.
