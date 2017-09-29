### Seperate Intents/Effects from Execution

Seperate description of what should be done from how it is actually performed. "What should be done" can be easily tested.

Example interface:
```swift
public static func processServerResponse(
        _ response: SyncResponse,
        request: SyncRequestType,
        state: SyncRequestState?
) -> (newState: SyncRequestState?, nextRequest: SyncRequestType?, processChanges: (() -> [ModelChange]))
```

Instead of performing work directly, the function returns a description of the work that should be performed.


### Separate Data from Behaviour (Avoid OOP Fallacy)

Instead of this:

![](https://github.com/Ben-G/Talks-Private/raw/master/Final_Talks/iOSConfSG2016/Slides-New/Assets/oo-subtype-polymorphism.png)



Do this:

![](https://github.com/Ben-G/Talks-Private/raw/master/Final_Talks/iOSConfSG2016/Slides-New/Assets/parametric-polymorphism.png)

What is really shared is the behavior; optimize sharing behavior by using generic types.

