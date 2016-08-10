Short post that summarizes the series of tweets in which Joe Groff discusses implementation differences between `weak` and `unowned`.

For `weak` references, memory is freed immediately after last strong reference is removed. For `unowned` object is invalidated and all resources are freed after last strong reference goes away; but object remains in memory as zombie, until last `unowned` reference is removed.

`weak` uses a global table to track `weak` references whereas `unowned` uses a second refcount on the object itself.

http://mjtsai.com/blog/2015/11/24/how-swift-implements-unowned-and-weak-references/
