http://jlongster.com/Whats-in-a-Continuation

> This means that when a continuation is created, it contains all the necessary information to resume the program exactly at the point in time which is was created.

```javascript
function foo() {
  var x = callCC(function(cont) {
    console.log("captured continuation");
    cont(5);
    console.log("continuation called");
  });

  console.log("returning x", x);
  return x;
}

console.log(foo());

```



> What happens when `cont` is invoked? It jumps back to line 3! The previous control flow is aborted and the stack when `cont` was captured is restored. **Any arguments passed to continuations *replace* the call to `callCC`, as if `callCC` returned that value. **

`callCC` is called -> passes control to continuation -> `cont` is called, passes control back to stack that was captured when `callCC` was invoked

(Related: [A Swift Continuation Monad](https://gist.github.com/CodaFi/2186a73bdfb9fff79c26))

> Continuations are like portals. If the image below represents your control flow, you can capture the current stack (the blue portal) and jump back to it at any time (the orange portals).
>
> [...]
>
> However, just like in the game Portal, these portals do not traverse time. The only thing that a continuation saves is the stack, so any changes to variables will still be seen after jumping through a continuation.

```javascript
function some(predicate, arr) {
  var x = callCC(function(cont) {
    for (var idx = 0; idx < arr.length; idx++) {
      console.log('testing', arr[idx]);
      if(predicate(arr[idx])) {
        cont(true);
      }
    }

    return false;
  });

  return x;
}

console.log(some(x => x >= 2, [1, 2, 3, 4]));	
```

> If you run this, you'll notice that it doesn't check `3` or `4`. It stops executing once `2` passes the predicate check. Step through the code and watch how it does that.
>
> Of course, we could use `break` to stop the `while` loop. But this is a trivial example; it's common to call out to other functions within the loop where you can't `break`. The native control operators are quite limiting. Continuations, however, allow you to travel across stack frames.

> This highlights a fundamental difference of continuations and anything currently in JavaScript: it suspends the entire stack. Generators suspend code as well, but their `yield` is shallow. It only suspends one frame, the generator itself.

**Implementing Exception Handling with Continuations**

```javascript
var tryStack = [];

function Try(body, handler) {
  var ret = callCC(function(cont) {
    tryStack.push(cont);
    return body();
  });
  tryStack.pop();

  if(ret.__exc) {
    return handler(ret.__exc);
  }
  return ret;
}

function Throw(exc) {
  if(tryStack.length > 0) {
    tryStack[tryStack.length - 1]({ __exc: exc }); // <- This is where continuation is invoked
  }
  console.log("unhandled exception", exc);
}
```

> The key here is that continuations can be resumed with values. The `return body()` line will return the final value of the code. At that point no continuation was invoked; it just passes that value through. But if `Throw` is invoked, it will call the captured continuation with an exception value
>
> Note that we pop the current handler off the stack before calling it, meaning that any exceptions that occur *within* exception handlers will properly be passed up the handler stack.

> So far we have always invoked a continuation *inside* the `callCC` call. That means we are always only jumping **up** the stack, meaning we're trying to jump back to a previous stack frame.
>
> There's a name for these kinds of continuations: [escape continuations](https://docs.racket-lang.org/reference/cont.html#%28def._%28%28quote._~23~25kernel%29._call-with-escape-continuation%29%29). 

Last section implements simple coroutines using the continuations.

---

## JS Generators vs. Continuations

In JS Generators can be defined with the `function*` keyword. Simple example:

```javascript
function* foo() {
  yield 'a';
  console.log("after a")
  yield 'b';
  console.log("after b")
  yield 'c';
}

for (const val of foo()) {
  console.log(val);
}
// a
// b
// c

const [...values] = foo();
console.log(values); // ['a','b','c']

```

When `yield` is called from within a a generator, execution of the function is paused and control is yielded to the caller of the function.



However, generators need to be sync. This throws an error:

```javascript
function* f() {
	yield 'a';
  setTimeout(function () {
  	yield 'b';
	}, 1000);
}

var generator = f()
console.log(generator)
console.log(generator.next())
console.log(generator.next())
```

Async/Await implemented with generators in JS: https://gist.github.com/ChrisChares/1ed079b9a6c9877ba4b43424139b166d

## How are continuations implemented in C#? 

https://www.simple-talk.com/dotnet/net-tools/c-async-what-is-it-and-how-does-it-work/



> Async is implemented using a compiler transform to implement code as a state machine, though this requires a few support classes in the runtime library, and that a set of methods need to be implemented on types that support asynchronous calls following the **Await** pattern. No changes are required to the CLR, though some support has been added inside **mscorlib**, and extra methods have been added to the **Task<…>** type to support the calls of the Awaiter pattern.

Answer [here](https://stackoverflow.com/questions/37667499/async-await-is-the-main-thread-suspended) has a nice explanation of how `async/await` works when used on the main thread. If `await` is used in an event handler, a continuation is stored and control is handed back to the UI run loop. After async task completes the continuation will complete running the event handler.



Another good article:

http://blog.stephencleary.com/2012/02/async-and-await.html