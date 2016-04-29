#Printing Type Name of Nested Type in Swift

The `dynamicType` property in Swift 2.2 implements `CustomStringConvertible` in a way that omits the parents type name. In order to print the full nested type name including the parent name it is necessary to explicitly print the `CustomDebugStringConvertible` implementation.

This can be done as following:
```swift
let s = String(reflecting: Foo.Bar.self.dynamicType)
```

Casting to `CustomDebugStringConvertible` should work as well, but fails to compile in Playgrounds.