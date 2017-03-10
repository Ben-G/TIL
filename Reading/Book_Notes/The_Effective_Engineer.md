Notes on "The Effective Engineer".

# Foreword & Intro

- Extremely few engineers understand how much influence they can have on the impact of their work; not by working harder, but by understanding which activities are high-leverage and which ones not
- Will not get credit for working hard on features that no one will use
- **Effective Engineers produce results**; when evaluating engineers we (should?) focus on outcomes: build features users pay for; build tools that improve team productivity


## Chapter 1: Focus on High Leverage Activities

- Example of high leverage activity: mentoring new employees
  - At Quora: dedicated mentor assigned for first few months
  - In a single year, a typical engineer works between 1,880 and 2,820 hours; Mentoring one hour every day for first month (20 hrs) adds up to only 1% of time new hire will work through first year
  - Teaching time saving skills in this period can have outsized impact
- Leverage is measured simply: Impact / Time 
- **Questions to ask to improve leverage:**
  - How can I complete this activity in shorter time?
  - How can I increase valu produced by activity?
  - Is there something else I could spend my time on that is more valuable?
- Practical examples of increasing leverage: meetings (*I'm aware of these, but definitely worth stating*):
  - Default to 30 minutes instead of 60 minutes meeting
  - Prepare agenda and circulate beforehand
  - Replace meeting with async communication if in-person is not relevant
- Focusing on leverage does not mean focusing on easy wins:
  - Example, 	Yishan Wong needed to direct a lot of time towards  making hiring at FB a top priority

**Takeaway:**

- Use leverage to measure engineering effectiveness, systematically increase leverage over time

*Key idea here is that engineers (especially in smaller orgs) have more freedom than they are aware of to choose what to work on. Realizing this can increase impact a lot, by shifting focus to high leverage activies. Also, be concious about how you spend your time.*

## Chapter 2: Optimize for Learning

- Pick the right environment to learn in: large company for depth of skills; smaller for breadth
- Growth mindest is incredibly important for learning
- Tamar Bercovici of Box recommends new hires to "own their story"
  - Didn't have full-time dev job before joining Box
  - Ended up leading distributed data team within 2 yrs
  - *Even if background is not perfect fit for current job; you will have learnt relevant skills; selling "your story" & growth mindest become more important in that case* 
- Reid Hoffman recommendation from *Startup of You*:
  - Treat yourself like startup; early on prioritize learning over profability
- Seek fast growth environments for learning
- **Ask specific questions ** to identify the learning potential your project could have (ideally before joining company, *Note: all of these are focused on folks interested in startups*)
  - Weekly monthly growth rates? 
  - Are there high priority initiatives to work on? That have sufficient support in resources?
  - How agressively has company been hiring? 
- Evaluate onboarding process: is there formal mentorship? What new things have team members learned recently?
- How open is the communication?
  - Do employees now about priorities of different teams?
  - Do teams do product/outage post-mortems?
  - How is knowledge shared/documented?
  - Examples of lessons learned from past projects?
- Is moving quickly considered a company value? (moving quicker enables more learning)
- During interview: what could you learn from interviewers? were interviews rigorous and comprehensive? (would you want to work with people that pass the interview?)
- Do people have autonomy over what to work on? Can they switch teams?
- **Take personal 20% time to improve skills daily**
- Work on a diversity of projects within the company; otherwise hard to pick up entirely new skills
- Jump fearless into unknown code

*Really liked the specific questions for prodding potential new companies. All of them are relevant for building a great engineering culture as well. Otherwise the chapter offered traditional insight: read, network, try to rotate projects, etc.*

## Chapter 3: Prioritize Regularly

- Learnt through Growth team at Quora that a great team constantly reprioritizes its work. Prioritization is a high leverage activity as it determines leverage of all your other work.
- Regularly evaluate impact and cost of your activities and ask if there's anything of higher leverage you could be doing instead.
- Focus on activites that have a measurable direct impact on time to product launch / number of users / sales or on other core business metrics of your team
- Make sure effort is proportional to expected impact; getting the major things right is much more important than getting every detail right.
- **Don't confuse urgency with importance**, prioritize non-urgent yet important tasks (longer term planning, personal development, building relationships, etc.)
- Keep maker's schedule when programming and plan in half-days to avoid interruptions.
  - "Microsoft Research found that employees take an average of 10 to 15 minutes to return to focused activity after handling email and instant messaging interruptions;"
- Avoid switching between projects, it makes it hard to build momentum on any of the projects.
- You can use *if-then* rule (from *Succeed* by Heidi Halvorson) to set mental triggers and overcome procrastination 
  - *Seems a little bit outside of the scope of this chapter...*
- Consider cancelling projects if expectations of impact change
  - E.g. you work on infrastructure project for 2 weeks that was expected to take 4 weeks; Now you think it will take 3 months; is it still worth completing?
- Recommmends using a todo-list with annotated effort for each task (e.g. in unites of 25 minute blocks) + keep track of time actually used. Then look how accurate estimates were in retrospect.

*Good reminder of risks of sunk cost fallacy. I've definitely worked on projects that migh have been rather cancelled than completed due to changed circumstances. Also like the idea of making re-prioritizing a habit. Keeping track of how estimates worked out is a good idea, too, but also seems like lots of overhead.* 

## Chapter 4: Invest in Iteration Speed

- From Facebook IPO letter by Zuckerberg:
  - “Moving fast enables us to build more things and learn faster however, as most companies grow, they slow down too much because they’re more afraid of making mistakes than they are of losing opportunities by moving too slowly … [I]f you never break anything, you’re probably not moving fast enough”
  - -> Faster iteration, more learning experiences
- Wealthfront CTO: Continous deployment is a method of risk reduction. Smaller changes make it easy to pin-point problems when they occur.
- Bobby Johnson, former Director of Infrastructure Engineering:
  - **"I've found almost all successful people write a lot of tools"**, a good indicator of success was when folks ran into problems, writing a tool was the first thing they would do.
  - Raffi Krikorian, former VP of Platform Eng at Twitter used to say to team: "If you have to do something manually more than twice, then write a tool for the third time."
- Languages with REPLs have a big advantage since they allow prototyping ideas quickly
- Use tool based approach for everything, e.g. debugging. Example: iOS app in which you want to debug something deep in the navigation stack. Rather spend a few minutes to modify the app to start up at the place of the problem instead of going through all the steps over and over again.
- Instagram CTO Mike Krieger: "Effective engineers have an obsessive ability to create tight feedback loops for what they're testing"
  - *IMO unit tests can be a great way to accomplish this.*
- Get familiar with UNIX shell commands
  - grep, sort, uniq, wc, awk, sed, xargs, find
  - Need to definitely improve on this one...*
- More iteration speed ideas:
  - Test ideas in interpreter (Swift playgrounds are good for this, also for prototyping UI)
  - Make it easy to run only unit tests affecting relevant to code changes
- Identify the major bottlenecks in your work day; even if they can't be solved with code and require steps such as process changes.

*The idea of reducing risk by shipping more frequently is definitely mainstream at this point. Chapter is a good reminder to invest in building tooling and master existing tools to improve iteration speed. Good to always be aware of major time sinks and work on removing them.*



## Chapter 5: Measure What You Want to Improve

- Peter Drucker from *The Effective Executive*: "If you can't measure it, you can't improve it".
- Good metrics help guard against product regressions
- Box has core indicators, such as latency that can't regress with a deployment. They need to be counterbalanced with improvements before they can be shipped.
- A lot of stuff is hard to measure. I've task you're working on doesn't move core metric, is it worth doing? Or is a key metric missing?
- Spend time picking the right metrics. Weekly active users by themselves might not be that useful. People can sign up and abandon service. Rather measure weekly active by age cohort: measure fraction of users who are still weekly actives after the *n*th week after signing up
  - Pick metrics that:
    - Maximize impact
    - Are actionable
      - I.e. changes in metric can be direcly tied to changes in product 
    - Are response, yet robust
      - Responsive: updates quickly enoug to give feedback on whether a change was positive or negative
      - Robust: things outside of team's control should not lead to a lot of noise in the metric
- Without metrics; we can only guess what is wrong with software. Should measure performance and other key metrics and make them visible to team in form of dashboards.
- Jeff Dean's [13 performance numbers](https://gist.github.com/jboner/2841832) that every engineer should know
- Being able to perform back-of-the-envelope calculations is really helpful
- Data can be abused; sometimes irrelevant metrics will be used to tell a false narrative; should be cautious
- **Log data liberally, in case it turn out to be useful later**
  - *Strong proponent of this! Data science capabilities are constantly improving and especially in early stage product it's often unclear which data might be helpful*
- Invest in tooling: Test analytics end-to-end, build tooling where necessary to improve data accuracy, examine collected data quickly, cross-validate accuracy by computing same metric in multiple ways.

*Always try to tie your work back to metric changes. Invest in collecting reliable data, make it easy to evaluate it.*

## Chapter 6: Validate Your Ideas Early

TBD

# Conclusion

Really great book overall; condenses a lot of practical lessons learned in recent years into a single book. Mostly offers practical advice. At times there's a missing causation link between a described action and the resulting outcome (mostly seems a lot of unmentioned factors were at play as well).