Priority inversion can occurr when sharing locks between threads with different priorities. If a lock is held by a low priority thread and a high priority thread is waiting on that lock to be freed, we call that a **priority inversion**, since the low priority thread now needs to run before the high priority thread can run.

This issue can be solved by [**priority inheritance**](https://en.wikipedia.org/wiki/Priority_inheritance) in which the low priority thread that is blocking the high priority thread temporarliy inherits the high priority until the lock is freed.

However, this is not possible with semaphores. Unlike most mutexes, semaphores can be freed by signaling from any thread, not only the thread that is currently performing work.

