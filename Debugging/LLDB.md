## Change LLDB Language

LLDB supports both Swift and Objective-C. The default language is picked based on the source file in which a breakpoint is set. But you can also change the language:

```
(lldb) settings set target.language objective-c
(lldb) settings set target.language swift
```

[Original Source: StackOverflow](http://stackoverflow.com/questions/37390238/how-can-i-set-lldbs-default-language-to-swift)

## PO Object At Address in Swift

*[Original Source: StackOverflow](http://stackoverflow.com/questions/29441418/lldb-swift-casting-raw-address-into-usable-type)*

How to print an object of a certain type at a provided address?

Example: 

- Type: `AnnotationView`
- Address: `0x7feed16dc530`

LLDB Commands:

```
e let $annotationView = unsafeBitCast(0x7feed16dc530, to: AnnotationView.self)
po  $annotationView

<AnnotationView: 0x7feed16dc530; frame = (0 0; 5100 3301); transform = [1.6999999284744263, 0, 0, 1.6999999284744263, 0, 0]; gestureRecognizers = <NSArray: 0x61000064c1b0>; layer = <CALayer: 0x60800043c200>>
```



## PO Object At Address in Objective-C

Example: 

- Type: `AnnotationView`
- Address: `0x7feed16dc530`

LLDB Commands:

```
p *(AnnotationView *)(0x7feed16dc530)

(AnnotationView) $22 = {
  UIView = {
    UIResponder = {
      NSObject = {
        isa = AnnotationView
      }
      _hasOverrideClient = false
      _hasOverrideHost = false
      _hasInputAssistantItem = false
    }
    _constraintsExceptingSubviewAutoresizingConstraints = 0x00006080006493f0 @"0 elements"
    _cachedTraitCollection = 0x00006180000da320
    _layer = 0x000060800043c200
    _layerRetained = 0x000060800043c200
 [...]
}
```



## Print Registers

```
(lldb) register read
```

http://www.enharmonichq.com/tutorial-ios-reverse-engineering-lldb/