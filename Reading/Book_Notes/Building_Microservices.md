# Additional Research

- [Benefits of using microservices with a mono-repo](http://blog.shippable.com/our-journey-to-microservices-and-a-mono-repository)
- [Good HN discussion](https://news.ycombinator.com/item?id=12134648) around the "End of Microservices" post from lightstep
  - "The reality is that microservices add a whole host of failure modes, for just one benefit over monoliths: They are easier to scale horizontally. If you don't *absolutely need*horizontal scalability, and not many companies do, then you'd be foolish to pay the large cost."
    - "If you are writing and deploying standalone applications, I agree. Microservices do have another benefit, though: forcing the application to be modularized. There are better ways to do that, though, like having proper systems engineering lay out the application architecture."
      - "Microservices don't *force* you to modularize, you can still make a mess by not cleanly separating things or by cutting across the wrong boundary. You modularized well because you created a clean, separated, thought-out architecture, not because of any intrinsic property of microservices."
        - [Comment: this thread doesn't touch on the deploy story, which might be the most important?]

