### [The design, implementation, and deployment of a system to transparently compress hundreds of petabytes of image files for a file storage service](https://blog.acolyer.org/2017/05/08/end-to-end-optimized-image-compression/)

- Describes how Dropbox implemented and deployed a new JPEG compression algorithm and saved 46 PiB of storage to date.

### [Typed Architectures: architectural support for lightweight scripting](https://blog.acolyer.org/2017/05/22/typed-architectures-architectural-support-for-lightweight-scripting/)

- Supports dynamic type checking in hardware, which significantly reduces overhead of code that needs dynamic type checking.
  - *"A recent study showed that around 25% of total execution time in the V8 JavaScript engine is spent on dynamic type checking. "*
  - *"When a tagged ALU instruction is executed, Typed Architecture looks up in a Type Rule Table with the two source type tags and the instruction’s op-code as the key. If it hits, the pipeline executes normally to write back the output type tag retrieved from the Type Rule Table together with the output value to the destination register. If not, a type misprediction has happened, and the PC is redirected to the slow path pointed to by the handler register to go through the original software-based type checking."*
  - ~10% speedup in SpiderMonkey (Firefox JS Engine)

### [The new dynamics of strategy: sense-making in a complex and complicated world](https://blog.acolyer.org/2017/10/17/the-new-dynamics-of-strategy-sense-making-in-a-complex-and-complicated-world/)

- Assumption that almost all outcomes can be mapped to specific behaviors, via reductionist thinking, might be wrong. We can't always determine a good strategy by looking at past outcomes. What we often assume to be causal links are often just chaotic connections

- The Cynefin framework creates 5 domains (complex, knowable, chaos, known, unkown); each require a different toolset for making sense of a situation

- >  This is the domain of complexity theory. Emergent patterns can be *perceived*, but not *predicted*, a phenomenon called ***retrospective coherence***. And this combination of perception without the ability to predict can get us into all sorts of troubles if we confuse the two

- We can end up creating procedures that worked great against historical scenarios, but might not work well in future



### [Debugging with intelligence via probabilistic inference](https://blog.acolyer.org/2018/06/19/debugging-with-intelligence-via-probabilistic-inference/)

- Paper outlines a debugging support tool that leverages probabilistic inference to determine the root cause of a failing test
- Test with 16 participants, randomly split into two groups showed 34% improvement in debugging speed
- Tool uses a constraint-solving approach that leverages encoded human knowledge around likelihood of issues in certain pieces of code (e.g. large functions are more likely to be cause of issue than small ones)

### [Deep Code Search](https://blog.acolyer.org/2018/06/26/deep-code-search/)

- Demonstrates use of deep learning for code search

- Uses first sentence of comment + code and generate an [embedding for each of them.](https://en.wikipedia.org/wiki/Word_embedding) The goal is to generate similar embeddings for both comment & code. 

  - > We don’t want just any old embedding though. We want to learn embeddings such that code snippets (think of them like ‘code sentences’ for now, we’ll get to the details shortly) and their corresponding descriptions have nearby embeddings.
    >
    > > Joint Embedding, also known as multi-model embedding, is a technique to jointly embed/correlate heterogeneous data into a unified vector space so that semantically similar concepts across the two modalities occupy nearby regions of the space.

- Cool, [longer form tutorial](https://towardsdatascience.com/semantic-code-search-3cd6d244a39c) that is linked from the the comments section on how to implementic semantic code search using multi-model embedding.

  - That in turn links to an apparently [very pragmatic AI course](http://course.fast.ai/). Should take that one!

### [Debugging data flows in reactive programs](https://blog.acolyer.org/2018/06/29/debugging-data-flows-in-reactive-programs/)

- Shows the ideas behind the creation of [RxFiddle](https://rxfiddle.net/) an interactive marble debugger for RxJS code.



Web app perf

- Touches on soom good issues with ORMs. One part, from the summary that I fully agree with:

  - > Note that fundamentally a lot of the issues stem from the fact that the ‘O’ in ORM could just as easily stand for ‘Opaque.’

- Study takes popular, large open source projects written in Rails from GitHub and performs automated load testing on them. It identifies the pages that load the slowest and profiles them. In many cases a significant amount of time is spent in the ORM/DB layer. 

- The authors categories all perf issues they find + issues from bug trackers resuling in three main categories: ORM API misuse, database design, and application design.

- Authors built a static analyzer to find some of these issues: https://hyperloop-rails.github.io/docs/home/