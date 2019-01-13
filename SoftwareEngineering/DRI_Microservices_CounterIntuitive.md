https://programmingisterrible.com/post/176657481103/repeat-yourself-do-more-than-one-thing-and

On Composition:

> The only real difference between pushing something together and pulling something apart is that some changes become easier to perform than others.

On microservices:

> The choice between a monolith and microservices is another example of this—the choice between developing and deploying a single service, or composing things out of smaller, independently developed services.
>
> The big difference between them is that cross-cutting change is easier in one, and local changes are easier in the other. Which one works best for a team often depends more on environmental factors than on the specific changes being made.
>
> Although a monolith can be painful when new features need to be added and microservices can be painful when co-ordination is required, a monolith can run smoothly with feature flags and short lived branches and microservices work well when deployment is easy and heavily automated.
>
> Even a monolith can be decomposed internally into microservices, albeit in a single repository and deployed as a whole. Everything can be broken into smaller parts—the trick is knowing when it’s an advantage to do so.



> # Modularity is more than reducing things to their smallest parts.
>
> Invoking the ‘single responsibility principle’, programmers have been known to brutally decompose software into a terrifyingly large number of small interlocking pieces—a craft rarely seen outside of obscenely expensive watches, or bash.



> # Modularity is about limiting the options for growth
>
> A given module often gets changed because it is the easiest module to change, rather than the best place for the change to be made. In the end, what defines a module is what pieces of the system it will never responsible for, rather what it is currently responsible for.
>
> When a unit has no rules about what code cannot be included, it will eventually contain larger and larger amounts of the system. This is eternally true of every module named ‘util’, and why almost everything in a Model-View-Controller system ends up in the controller.



> Decomposing things into smaller parts or unifying them is neither universally good nor bad for the codebase, and largely depends on what changes come afterwards.
>
> In the same way abstraction isn’t about code reuse, but coupling things for change, modularity isn’t about grouping similar things together by function, but working out how to keep things apart and limiting co-ordination across the codebase.
>
> **This means recognizing which bits are slightly more entangled than others, knowing which pieces need to talk to each other, which need to share resources, what shares responsibilities, and most importantly, what external constraints are in place and which way they are moving.**
>
> In the end, it’s about optimizing for those changes—and this is rarely achieved by aiming for reusable code, as sometimes handling changes means rewriting everything.

Reminds me of how TAO at FB is a monolith because data needs to be tightly coupled: https://www.facebook.com/notes/facebook-engineering/tao-the-power-of-the-graph/10151525983993920/

https://www.usenix.org/system/files/conference/atc13/atc13-bronson.pdf



> The reason rewrites are so risky in practice is that replacing one working system with another is rarely an overnight change. **We rarely understand what the previous system did—many of its properties are accidental in nature.** 
>
> Documentation is scarce, tests are ornamental, and interfaces are organic in nature, stubbornly locking behaviors in place.



> **A new project has the most room for feature bloat—this is known as the second-system effect.**
>
> [...]
>
> It’s a similar to writing a game engine without a game to implement to guide decisions, or a framework without a product inside. The resulting code is an unconstrained mess that is barely fit for its purpose.