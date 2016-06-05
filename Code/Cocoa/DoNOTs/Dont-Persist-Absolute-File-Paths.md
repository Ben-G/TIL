#Don't Persist Absolute Filesystem Paths in Cocoa

I ran into this very early in my very first job as iOS developer. We had an app that was persisting paths to documents in the filesystem. It used absolute paths instead of relative ones.

The absolute path to a file on iOS includes the path to your sandbox and the path to your sandbox can and will change throughout app / OS updates. After the sandbox identifier changes you will no longer find the documents that you stored at the persisted file path.

**Always persist paths relative to your document / caches / tmp directory and reconstruct the full path at runtime**.

If you see filesystem path like this in your local persistence layer:
```
/var/mobile/Applications/4A01E0B1-E409-4065-BB69-A16644826948/Documents/somedir/mydoc.pdf
```

You will want to revisit the relevant code!

[Here's a more detailed blog post on the same issue.](http://aplus.rs/2013/never-save-absolute-file-paths-in-your-ios-app/)