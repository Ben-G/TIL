# Linking Internal Frameworks

This post describes how to link internal frameworks that are part of the same workspace but in different Xcode projects. It's not a complete description but instead a collection of a few gotchas that I ran into.

**Add Dependent Project as Subproject**

Even though the dependent project providing the internal library is part of the same workspace, it needs to be added as a reference tot he project that imports the library:

![](AddProjectSubproject.png)

**Set up a Target Dependency**

Ensure that the dependent target is always built before the project that imports the dependency.

![](TargetDependency.png)

**Ensure the Path of the Build Product**

This should work by default; but it's important that the path of the imported build product is `Relative to Build Products`. This will avoid references to absolute file paths in the Xcode project file.

![](EnsureBuildProductPath.png)
