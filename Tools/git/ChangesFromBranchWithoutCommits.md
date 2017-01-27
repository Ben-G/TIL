Want all changes between your branch and another, but without the commit history? Checkout is your friend:

Checkout target branch, then use `checkout sourcebranch .` to get all changes without commit history applied as unstaged changes. 

`

git checkout refactor-annotations .

`

Also works for individual files. More background, here: http://jasonrudolph.com/blog/2009/02/25/git-tip-how-to-merge-specific-files-from-another-branch/