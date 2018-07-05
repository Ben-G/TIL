# Micro Frontends

### Overview

Similar idea to microservices; split up apps into multiple apps.

Was wondering why this is a topic of interest on Web; whereas other client applications (e.g. native mobile) don't seem to face the same problems that would lead to splitting up an app. It seems like there are two core reasons:

- Dependecy management is hard in frontend world
  - Much, much more dependencies
  - Dependencies move faster and introduce more breaking changes
  - As a result, keeping dependencies up to date on large projects is difficult; especially when there is no organizational incentive
  - This becomes easier when apps are split up into smaller apps - each app can handle its own dependencies and can move independently of other apps
- Deployment of monolithic app can be challenging
  - Web apps are deployed continously by default
  - If you have a large suite of automation and integration tests, that deployment can take a long time for a large monolithic app
  - Easier for each team to own a smaller part of the codebase that they can deploy faster without being blocked by deploys of other teams
- Frontend devs often like to be able to use heterogenous tech stacks 
  - Micro frontends allow static HTML on one page; Vue on another page; React on yet another

### Resources

- Good overview post, that links to many other good posts: [Micro frontends—a microservice approach to front-end web development](https://medium.com/@tomsoderlund/micro-frontends-a-microservice-approach-to-front-end-web-development-f325ebdadc16)

- [Short HN discussion](https://news.ycombinator.com/item?id=13009285) on which tools people use to develop micro frontends

  