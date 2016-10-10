# Script for Automatically Deleting Merged Branches

Delete all merged local branches:

`git branch --merged | grep -v "\*" | grep -v "dev" | xargs -n 1 git branch -d`

Delete all merged remote branches:

`git branch --remote --merged | awk '{split($0,a,"origin/"); print a[2]}' | xargs -n 1 git push origin --delete`

Breaking it down:

- `grep -v`: inverse match; include all lines except matching ones
- `xargs -n`: define maximum amount of valid arguments for command; xargs will break stdin lines into chunks according to value passed to `-n`


Count of local branches:

`git branch | wc -l`

Also have ruby script for manual deletion:

https://gist.github.com/Ben-G/f971c4fefb381cac22e85baf74e9744d