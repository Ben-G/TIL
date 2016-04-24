#Type Providers in F#

F# has type providers that make bridging between outside resources and statically typed code easier. Thanks to joegroff for sharing:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/brentsimmons">@brentsimmons</a> <a href="https://twitter.com/JadenGeller">@JadenGeller</a> F# for example has &quot;type providers&quot; that import external data like DB schemas into the static type system.</p>&mdash; Joe Groff (@jckarter) <a href="https://twitter.com/jckarter/status/723244016695914496">April 21, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Here's a good example of a JSON type provider: http://fsharp.github.io/FSharp.Data/library/JsonProvider.html. The type provider can be configured with an example JSON file, thereafter the provider can be used for transforming untyped data into static types.
