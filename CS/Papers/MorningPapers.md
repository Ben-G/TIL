### [The design, implementation, and deployment of a system to transparently compress hundreds of petabytes of image files for a file storage service](https://blog.acolyer.org/2017/05/08/end-to-end-optimized-image-compression/)

- Describes how Dropbox implemented and deployed a new JPEG compression algorithm and saved 46 PiB of storage to date.

### [Typed Architectures: architectural support for lightweight scripting](https://blog.acolyer.org/2017/05/22/typed-architectures-architectural-support-for-lightweight-scripting/)

- Supports dynamic type checking in hardware, which significantly reduces overhead of code that needs dynamic type checking.
  - *"A recent study showed that around 25% of total execution time in the V8 JavaScript engine is spent on dynamic type checking. "*
  - *"When a tagged ALU instruction is executed, Typed Architecture looks up in a Type Rule Table with the two source type tags and the instruction’s op-code as the key. If it hits, the pipeline executes normally to write back the output type tag retrieved from the Type Rule Table together with the output value to the destination register. If not, a type misprediction has happened, and the PC is redirected to the slow path pointed to by the handler register to go through the original software-based type checking."*
  - ~10% speedup in SpiderMonkey (Firefox JS Engine)