#Nil Coalescing Ternary Operator in Objective-C

Today I discovered the usage of the ternary operator in Objective-C as a nil coalescing operator:

```
NSArray *newArray = [self.backingArray arrayByAddingObject:obj ?: RACTupleNil.tupleNil];
```

By omitting the success case from the operator, the expressions before the `?` will be returned in the success case (it will also only be evaluated once). If the expression before the `?` results to `false`/`nil`/`0` the expression after the `:` is returned.

[This feature is provided by a GNU extension that is supported by Clang.](http://stackoverflow.com/questions/12420144/how-wide-spread-is-this-gnu-extension-on-ternary-operation)

No idea how I could miss this for so long?