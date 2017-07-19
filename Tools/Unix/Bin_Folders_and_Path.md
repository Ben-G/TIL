## Different `bin` Directories in Unix Systems

[Overview of different `bin` directories in Unix systems](http://blog.taylormcgann.com/2014/04/11/difference-bin-sbin/). (usr/bin, usr/local/bin, /sbin, etc.)

[Another good answer](`/usr/local/bin` is for normal user programs *not* managed by the distribution package manager, e.g. locally compiled packages. You should not install them into `/usr/bin` because future distribution upgrades may modify or delete them without warning.):

- `sbin` variants of all folders are for system management tools; not tools used by typical users

- >  `usr/local/bin`  is for normal user programs *not* managed by the distribution package manager, e.g. locally compiled packages. You should not install them into `/usr/bin` because future distribution upgrades may modify or delete them without warning.  



## Using Executable Location from $PATH 

> The PATH environment variable is a colon-delimited list of directories that your [shell](https://kb.iu.edu/d/agvf) searches through when you enter a command.

[source](https://kb.iu.edu/d/acar)

To run a version of an executable that is in a user's PATH, use:

`/usr/bin/env ruby -v`

On my current setup this returns

`ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-darwin15]`

since I'm using `rvm` to switch between ruby versions and have selected `2.3.1`



Whereas

`/usr/bin/ruby -v`

returns

`ruby 2.0.0p648 (2015-12-16 revision 53162) [universal.x86_64-darwin16]`

which is the system default.



This came up, because the Bugsnag dsym upload script was referring to the `usr/bin` path, which meant it was executing ruby 2.0; whereas fastlane was executed via Bundler which was using ruby 2.3.

[Bundler uses ruby from $PATH by default](https://github.com/bundler/bundler/issues/4260#issuecomment-177621474)