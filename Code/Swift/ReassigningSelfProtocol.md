TIL it is possible to re-assign self within an initializer defined in a protocol extension:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/Javi">@Javi</a> A protocol extension initializer can reassign self, if that&#39;s the only reason you needed ObjC.</p>&mdash; Joe Groff (@jckarter) <a href="https://twitter.com/jckarter/status/730560421246066689">May 12, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Example:

```swift
protocol Initializer {
    var name: String? { get set }

    init()
}

extension Initializer {
    init(name: String) {
        var x = Self()
        x.name = name

        self = x
    }
}

class A: Initializer {
    var name: String?

    required init() {}
}

var test = A()

print(test)
```