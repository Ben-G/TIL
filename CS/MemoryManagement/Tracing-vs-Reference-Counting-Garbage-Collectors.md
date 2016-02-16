#Tracing vs. Reference Counting Garbage Collectors

After joining a [twitter conversation on reference counting vs. tracing garbage collectors](https://twitter.com/jordwalke/status/694007190248517632), I read a [really interesting paper](https://www.cs.virginia.edu/~cs415/reading/bacon-garbage.pdf) on memory management that was shared by [@jordwalke](https://twitter.com/jordwalke).

It describes how reference counting and tracing garbage collectors almost converge when optimized. It argues that both follow the same fundamental algorithm. When an object gets deallocated, reference counting garbage collectors start with an overstated reference count on all counted objects; starting from the deallocated object all of its references are visited and there reference count is decreased by one. This continues until all referenced objects have been visited.

Tracing garbage collectors start with an understated reference count (usually 0). From a given root they visit all references and increase their reference count by one (for the purpose of the paper it is assumed that tracing collector uses a reference count, not a simple binary flag to represent referenced/non-referenced objects).

The paper shows that both types of GCs are very similar to start with. As they are optimized for different use cases they always converge into a hybrid solution.

Really interesting read; full of details that show how incredibly difficult it is to design a well functioning garbage collector.

There's a pretty exhaustive list of other papers related to GC theory [here](http://stackoverflow.com/questions/1318631/learning-garbage-collection-theory).