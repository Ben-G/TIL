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