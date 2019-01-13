To Microservice, or not to microservice:

- https://martinfowler.com/articles/microservice-trade-offs.html
- http://basho.com/posts/technical/microservices-please-dont/
- https://aadrake.com/posts/2017-05-20-enough-with-the-microservices.html
  - Largest takeaways: microservices are often not the solution for the problem you are trying to solve. They can probably offer the biggest benefits if you have truly independent services with different levels of complexity that can be shipped on a different release schedule.


- http://www.dwmkerr.com/the-death-of-microservice-madness-in-2018/
  - Don't underestimate operational complexity of microservices
  - Understand which kind of applications can actually benefit from using microservices; if your services are still fairly tightly coupled you will loose almost all the benefits of microservices
  - Consider complexity of shared state (e.g. in shared databases)
  - Consider versioning issues, espcially around cross-communication of services
  - Distributed transactions are very hard

- https://programmingisterrible.com/post/176657481103/repeat-yourself-do-more-than-one-thing-and


  - Good general advice of what modularity means and how it always depends on the context
  - This means recognizing which bits are slightly more entangled than others, knowing which pieces need to talk to each other, which need to share resources, what shares responsibilities, and most importantly, what external constraints are in place and which way they are moving.

- https://programmingisterrible.com/post/162346490883/how-do-you-cut-a-monolith-in-half


  - >  Once you can handle success, it is time to handle the errors. The first step is often adding code to retry the request a few times. After you DDoS your system, you put a call to sleep(). After you slowly DDoS your system, each retry waits twice as long as the previous.

    > (Aside: Accidental synchronisation is still a problem, as waiting to retry doesn’t prevent a lot of things happening at once.)

  - > How you cut a monolith is often more about how you are cutting up responsibility within a team, than cutting it into components. It really does depend, and often more on the social aspects than the technical ones, but you are still responsible for the protocol you create.

  - > Distributed systems are messy because of how the pieces interact over time, rather than which pieces are interacting. The complexity of a distributed system does not come from having hundreds of machines, but hundreds of ways for them to interact. A protocol must take into account performance, safety, stability, availability, and most importantly, error handling.
    >
    > When we talk about distributed systems, we are talking about power structures: how resources are allocated, how work is divided, how control is shared, or how order is kept across systems ostensibly built out of well meaning but faulty components.
    >
    > A protocol is the rules and expectations of participants in a system, and how they are beholden to each other. A protocol defines who takes responsibility for failure.
    >
    > The problem with message brokers, and queues, is that no-one does.

  - > I say don’t rely on a message broker, but I can’t point to easy off-the-shelf answers. HTTP and DNS are remarkable protocols, but I still have no good answers for service discovery.

- Modules vs microservices: https://www.oreilly.com/ideas/modules-vs-microservices


  - > When your organization is at the scale of Google or Netflix, it makes complete sense to embrace microservices. You have the capacity to build your own platform and toolkits, and the number of engineers prohibits any reasonable monolithic approach. But most organizations don't operate at this scale. Even if you think your organization will become a billion-dollar unicorn one day, starting out with a modularized monolith won't do much harm.





Sharing databases in microservices:

- http://microservices.io/patterns/data/database-per-service.html
- http://microservices.io/patterns/data/shared-database.html



How-tos:

- https://martinfowler.com/articles/break-monolith-into-microservices.html

- Evolution of LinkedIn from Monolith to Services: https://engineering.linkedin.com/architecture/brief-history-scaling-linkedin

  - > We built mid-tier services to provide API access to data models and backend data services to provide consistent access to its database(s)

  - > By 2010, we already had over 150 separate services. Today, we have over 750 services (2015)

- Service mesh

  - https://kublr.com/blog/implementing-a-service-mesh-with-istio-to-simplify-microservices-communication/