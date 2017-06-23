## Detecting by which gesture recognizer a touch was cancelled

```
(lldb) po [[event.allTouches anyObject] gestureRecognizers]

<__NSArrayI 0x618000472dc0>(

<UILongPressGestureRecognizer: 0x7f9684c78c70; state = Began; view = <AnnotationView 0x7f9684e7f970>; target= <(action=handleLongPress:, target=<AnnotationView 0x7f9684e7f970>)>>,

<UITapGestureRecognizer: 0x6180001adac0; state = Possible; view = <UIView 0x7f9684c74c80>; target= <(action=handleFingerTap:, target=<DocumentViewController 0x7f9686184800>)>>,

<UITapGestureRecognizer: 0x6180001ad9e0; state = Possible; view = <UIView 0x7f9684c74c80>; target= <(action=handleFingerDoubleTap:, target=<DocumentViewController 0x7f9686184800>)>; numberOfTapsRequired = 2>,

<UIScreenEdgePanGestureRecognizer: 0x7f9684d31200; state = Failed; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7f96872022d0>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7f9684d310c0>)>>,

<_UISystemGestureGateGestureRecognizer: 0x600000181790; state = Possible; delaysTouchesEnded = NO; view = <MBFingerTipWindow 0x7f9684c11f60>>

)
```

This gesture recognizer is responsible:

```
<UILongPressGestureRecognizer: 0x7f9684c78c70; state = Began; view = <AnnotationView 0x7f9684e7f970>; target= <(action=handleLongPress:, target=<AnnotationView 0x7f9684e7f970>)>>
```
