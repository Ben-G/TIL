#Building Swift & Testing Standard Library

1. When rebasing from remote, do not forget to update Swift's dependencies as well (LLVM, etc.). Within the `swift` folder run `./utils/update-checkout`
2. For a regular build use: `./utils/build-script`
3. Testing only the standard library can be accomplished with this command:
`../llvm/utils/lit/lit.py ../build/Ninja-DebugAssert/swift-macosx-x86_64/test-macosx-x86_64/1_stdlib/`
