Really good article on current state of threading and synchronization in Swift, as of Swift 2.2/3.0:

http://www.cocoawithlove.com/blog/2016/06/02/threads-and-mutexes.html

Also has some interesting metrics of cost of closure capture in Swift. Though this should be optimized for `noescape` closures in future by stack-allocating them instead of storing them on the heap.