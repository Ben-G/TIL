#Promotion to Optionals in Function Signatures

Whenever possible Swift will promote an non-optional type to an optional one in order to match the type signature of a function.

This allows us to call the following function with both an optional or a non-optional input:

```swift
func takesThing<T>(thing: T?) -> T? {
    return thing
}
```
If we call it with an optional input, the return value will also be an optional:

```swift
let optionalI: Int? = 3
let x = takesThing(optionalI)
print(x)
// Output: "Optional(3)\n"
```

The same is true for a function with this signature:

```swift
func takesThing<T>(thing: T) -> T {
    return thing
}
```

It can be called with an optional input - resulting in an optional return value. The input and the output will have the same level of optionality.

This quickly becomes a little more interesting. Assuming you have a function that takes a non-optional type and performs a check and finally returns an optional value of the same type:

```swift
func takesThing<T>(thing: T) -> T? {
    return thing
}
```

You will receive an `Optional<Optional<T>>>` as a return type of the function. The return type is *on more optional* than the input type.

If you want to flatten the result; i.e. return nil if the input is nil OR the check failed, you will need to provide an overload of the function that takes an optional and returns an optional:

```
func takesThing<T>(thing: T?) -> T? {
    return thing
}
```

No the return type will always be an `Optional` whether this function was called with an optional or with a value.

And finally, this optional promotion mechanism has its caveats:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Great real-world example of how Swift Optional-promotion can bite you in generic code. Be careful out there. <a href="https://t.co/UZgRVBoDO5">https://t.co/UZgRVBoDO5</a></p>&mdash; Rob Napier (@cocoaphony) <a href="https://twitter.com/cocoaphony/status/689096802008707074">January 18, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
