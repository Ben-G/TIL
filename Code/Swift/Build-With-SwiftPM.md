#Build & Run Swift Code Using Swift PM Instead of Xcode

Today I took a few minutes to set up a small example project that I could build & run with SwiftPM instead of Xcode.

Here are the necessary steps:

1. Download a [Trunk Swift Snapshot](https://swift.org/download/#releases) (as of today only these snapshots contain SwiftPM)
2. Assuming Xcode 7.3 is installed, run: `export TOOLCHAINS=swift`
3. Verify installation with `swift build --version`
4. Create new folder with a Swift Package file, I used this one:

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/VeniceX/Venice.git", majorVersion: 0, minor: 4)
    ]
)
```

5. Create a Swift file for the application itself. In my case:

```swift
import Venice

func f(from: String) {
    for i in 0 ..< 4 {
        print("\(from): \(i)")
        yield
    }
}

co(f("coroutine"))

co {
    print("going")
}

nap(1.second)
print("done")

```
6. Run `swift build`
7. Run the executable in the build folder; in my case: `.build/debug/Coroutines`
8. Marvel at the output:

```
coroutine: 0
going
coroutine: 1
coroutine: 2
coroutine: 3
done
```
