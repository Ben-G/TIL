When working with GCD, don't rely on `NSThread.isMainThread()` for checking if we are on the main queue. Some UIKit components want to be called on the main queue not on any arbitrary queue that is bound to the main thread. See example from RAC issue in combination with `MKMapView`: https://github.com/ReactiveCocoa/ReactiveCocoa/issues/2635

The solution is to use `dispatch_queue_set_specific` to associate a key-value pair with the specific queue we want to check for (e.g. main queue), and later check for that queue to see if we are on the main queue: https://github.com/ReactiveCocoa/ReactiveCocoa/pull/2912.

Marcin Krzyzanowski wrote a blog post elaborating this issue: http://blog.krzyzanowskim.com/2016/06/03/queues-are-not-bound-to-any-specific-thread/