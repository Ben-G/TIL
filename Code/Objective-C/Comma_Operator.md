#Comma Operator in C

Conrad Kramer shared an interesting issue on twitter:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Spot the error: <a href="https://t.co/QejPIlF9lA">https://t.co/QejPIlF9lA</a><br><br>Yeah, clang couldn’t either :(</p>&mdash; Conrad Kramer (@conradev) <a href="https://twitter.com/conradev/status/705648516886999040">March 4, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

I didn't know about it until now, but apparently `,` is [an operator in C](https://en.wikipedia.org/wiki/Comma_operator). So far I had assumed it is only valid within a for loop definition.

As this example shows this operator should be used as little as possible.
