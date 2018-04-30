Clojure provides three lock free types that allow concurrently modifying values, all rely heavily on Clojures use of persistent data structures:

- [Atoms](https://clojure.org/reference/atoms) (set/access a single value synchronously)

  - Retries a `compare-and-set` operation until successful (https://github.com/clojure/clojure/blob/861d48ea761418fcb59dc4eb1c63bd29c2f35231/src/jvm/clojure/lang/Atom.java#L36-L39)
  - Comparable to [OSAtomic](https://www.mikeash.com/pyblog/friday-qa-2011-03-04-a-tour-of-osatomic.html), works well because swap operation is just a pointer swap
  - Atomics in Swift: https://forums.developer.apple.com/thread/62765

- [Agents](https://clojure.org/reference/agents) (set/access a single value asynchronously)

  - > the state of an Agent is always immediately available for reading by any thread

  - > Agents are integrated with the STM - any dispatches made in a transaction are held until it commits, and are discarded if it is retried or aborted.

  - Like a readers-writer lock (except readers are never blocked…) implemented with a serial GCD queue to which modifications are asynchronously dispatched?

  - What are implementation details that allow writers to not block readers?

  - Just learned that this alternative that does [not](https://github.com/clojure/clojure/blob/861d48ea761418fcb59dc4eb1c63bd29c2f35231/src/jvm/clojure/lang/Atom.java#L36-L39) lock readers is called [`Read-copy-update`](https://en.wikipedia.org/wiki/Read-copy-update), writers are blocked in favor of readers (I assume this is the underlying principle behind agents?)

  - Still not quite sure how implementation here works… https://github.com/clojure/clojure/blob/master/src/jvm/clojure/lang/Agent.java#L113-L116

    - I guess `setState` is atomic? -> can see that is uses the Java `volatile` keyword -> sufficient since [Clojure uses immutable data structures](https://clojure.org/reference/data_structures)

  - Lastly: agents are transaction aware; if transactions roll back, changes done via agents within the transaction are rolled back as well

- [Refs](https://clojure.org/reference/refs) (STM, software transactional memory, shared mutable state of multiple values encapsulated in a transaction)

  - Simplified: like DB transactions; if conflicts occur while running, transaction will be reapplied

General theme: concurrency and mutation via compare & swap is easier in Clojure because most data types are immutable (persistent data structures)

https://8thlight.com/blog/aaron-lahey/2016/07/20/relationship-between-clojure-functions-symbols-vars-namespaces.html