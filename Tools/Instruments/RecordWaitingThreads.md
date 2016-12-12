Pro-tip:

Check "record watiting Threads" when performing time profiling. This will include the time threads have waited when determining the % of overall time a thread spent running. 

In case you're thread is waiting on external resources, you may only have 20% CPU utilization, but your thread can still be blocking the critical path of execution while waiting for the outside resource to become available. Pracital example: thread waiting for writer lock on DB.

Good post that summarizes everything:

https://www.bignerdranch.com/blog/rock-heads/