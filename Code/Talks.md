#iOS
- [Backend Driven Native UIs](https://code.facebook.com/posts/1566627733629653/mobile-scale-london-recap/), Mobile @ Scale 2016
	- Great discussion of component driven UIs at Spotify
	- Demonstrates how UIs are build from declarative descriptions that can be serialized 	
- [Reverse Engineering iOS Apps: Hacking on Lyft](https://realm.io/news/conrad-kramer-reverse-engineering-ios-apps-lyft/), SLUG 2015
	- Awesome demo of reverse engineering techniques for iOS apps

#CS 
- [Differential Synchronization](https://www.youtube.com/watch?v=S2Hp_1jqpY8), Google Tech Talks, 2009
	- Discusses a synchronization mechanism that's an alternative to Operational Transformation 
	- Interesting related blog post: http://codebrief.com/2013/08/client-sync-for-the-rest-of-us/ 

#SE
- [Thinking above the Code](https://www.youtube.com/watch?v=-4Yp3j_jk8Q), Microsoft Research, 2014
	- Discusses interesting aspects of importance of specs 
- [Turning the Database Inside Out](https://www.youtube.com/watch?v=fU9hR3kiOK0), Strange Loop, 2014
	- Immutable, Append only DB instead of Shared Mutable State
	- Expose Transaction Log / Event Stream; Materialized Views are Updated with the content appended to the transaction log
	- "The difference to traditional database architecture is that if you want to write to the system, you don’t write directly to the same databases that you read from. Instead, you write to the log, and there is an explicit transformation process which takes the data on the log and applies it to the materialized views."
- [Conceptualizing Large Software Systems](http://www.thedotpost.com/2015/11/alan-shreve-conceptualizing-large-software-systems), dotGo, 2015
	- Discusses techniques/tools to make large code bases more approachable / make it easier to understand code structure
	- Uses Go test coverage + compiler tools to strip down relevant code based on test cases
