# General

- [Want to watch] Excel tips from Joel Spolsky: https://www.youtube.com/watch?v=0nbkaYsR94c

# iOS

- [Backend Driven Native UIs](https://code.facebook.com/posts/1566627733629653/mobile-scale-london-recap/), Mobile @ Scale 2016
- Great discussion of component driven UIs at Spotify
  - Demonstrates how UIs are build from declarative descriptions that can be serialized 
- [Reverse Engineering iOS Apps: Hacking on Lyft](https://realm.io/news/conrad-kramer-reverse-engineering-ios-apps-lyft/), SLUG 2015
- Awesome demo of reverse engineering techniques for iOS apps
- [How not to build an iOS SDK](https://realm.io/news/altconf-conrad-kramer-writing-iOS-sdk/) 
- Nice Summary of iOS SDK best practices and anti-patterns
- [React Native at AirBnb](https://www.youtube.com/watch?v=tUfgQtmG3R0)
  - Good overview of real-world experience adding React Native to a large existing app.
#CS 
- [Differential Synchronization](https://www.youtube.com/watch?v=S2Hp_1jqpY8), Google Tech Talks, 2009
  - Discusses a synchronization mechanism that's an alternative to Operational Transformation 
  - Interesting related blog post: http://codebrief.com/2013/08/client-sync-for-the-rest-of-us/ 

# SE

- [Thinking above the Code](https://www.youtube.com/watch?v=-4Yp3j_jk8Q), Microsoft Research, 2014
  - Discusses interesting aspects of importance of specs & proofs
- [Turning the Database Inside Out](https://www.youtube.com/watch?v=fU9hR3kiOK0), Strange Loop, 2014
  - Immutable, Append only DB instead of Shared Mutable State
  - Expose Transaction Log / Event Stream; Materialized Views are Updated with the content appended to the transaction log
  - "The difference to traditional database architecture is that if you want to write to the system, you don’t write directly to the same databases that you read from. Instead, you write to the log, and there is an explicit transformation process which takes the data on the log and applies it to the materialized views."
- [Conceptualizing Large Software Systems](http://www.thedotpost.com/2015/11/alan-shreve-conceptualizing-large-software-systems), dotGo, 2015
  - Discusses techniques/tools to make large code bases more approachable / make it easier to understand code structure
  - Uses Go test coverage + compiler tools to strip down relevant code based on test cases



# ML

- https://www.crowdflower.com/train-ai-2017/ Peter Norvig's Talk (can't link directly)
  - SE: Mathemetical Science; ML: Natural Science
  - ML still early on:
    - So far only able to classify small slices of pictures accurately
    - Easy to fool ML systems (example panda image + noise applied)
  - Bugs in ML hard to find; no clear inputs & outputs
  - Feedback loops exist in which ML influences users enough such that past ML data is no longer valid
  - ML lacks tooling

#Tools

- [Catastrophic Backtracking in Regex](https://vimeo.com/112065252), Stack Overflow Interal Talk, 2014
  - Discusses how backtracking in regex caused downtime on Stack Overflow
  - Also discusses how to avoid catastrophic backtracking 
