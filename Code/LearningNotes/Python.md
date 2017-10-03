Notes on basic python tutorial: https://docs.python.org/3/tutorial/

- Default arguments are only evaluated once


- `else` statements can be used on loops and are called when loop does not `break`

- Functions can be called with optional keyword arguments

  - > In a function call, keyword arguments must follow positional arguments.

  - `parrot(voltage=1000000, action='VOOOOOM') `

  - `parrot('a thousand', state='pushing up the daisies')`

- `*name` and `**name` are special parameters that can appear at the end of the parameter list; after positional and keyword arguments:

  - `*name` receives all positional arguments that don't match any of the formal parameters
  - `**name` is a dictionary that receives all keyword arguments that don't match any of the formal parameters
  - The order of parameters for each is guaranteed to be the order in which arguments were passed

- Opposite can be done with *unpacking* tuples/lists into an argument list:

   ```python
    >>> list(range(3, 6))            # normal call with separate arguments
    [3, 4, 5]
    >>> args = [3, 6]
    >>> list(range(*args))            # call with arguments unpacked from a list
    [3, 4, 5]
   ```

- `lamdba`s are restricted to a single expression

- Docstrings are available under a magic variable: `print(my_function.__doc__)`

- Type annotations are optional and can be accessed via `__annotations__`

- List comprehension is available as alternative to `map`:

  - `squares = list(map(lambda x: x**2, range(10)))`

  - `squares = [x**2 for x in range(10)]`

  - > A list comprehension consists of brackets containing an expression followed by a [`for`](https://docs.python.org/3/reference/compound_stmts.html#for) clause, then zero or more [`for`](https://docs.python.org/3/reference/compound_stmts.html#for) or [`if`](https://docs.python.org/3/reference/compound_stmts.html#if) clauses. The result will be a new list resulting from evaluating the expression in the context of the [`for`](https://docs.python.org/3/reference/compound_stmts.html#for) and [`if`](https://docs.python.org/3/reference/compound_stmts.html#if) clauses which follow it. For example, this listcomp combines the elements of two lists if they are not equal:
    >
    > ```
    > >>> [(x, y) for x in [1,2,3] for y in [3,1,4] if x != y]
    > [(1, 3), (1, 4), (2, 3), (2, 1), (2, 4), (3, 1), (3, 4)]
    > ```

  - List comprehensions can be nested; good replacement for nested loops

    - ```python
      matrix = [
          [1, 2, 3, 4],
          [5, 6, 7, 8],
          [9, 10, 11, 12]
      ]

      # Iterate over columns (0-3); for each column iterate over the rows.
      print([[row[i] for row in matrix] for i in range(4)])
      ```

    - Nested expressions is executed in context of outer expression

      - ```python
        >>> transposed = []
        >>> for i in range(4):
        ...     transposed.append([row[i] for row in matrix])
        ...
        >>> transposed
        [[1, 5, 9], [2, 6, 10], [3, 7, 11], [4, 8, 12]]
        ```

- `del` can be used to delete list entries and even entire variables

- Tuples are immutable. Values can be accessed by index. Tuples can be created without parantheses.

  - Named tuples can be created via the `namedtuple` type. Allows giving tuple members names.
  - Single tuples need comma after first and only value
  - Tuple unpacking is supported, too. No parenthesis required.

- Use `in` / `not in` to check membership of keys in `Dictionaries`

- `items()` allows iterating over key-value pairs

- `enumerate` allows iterating with index

- `is` / `is not` can be used to compare object identify; equivalent to `===` in Swift

- Boolean expressions return last evaluated argument



- `str()` provides human-readable description of a value; `repr()` returns description intended for interpreter

  - More on `repr()`

    > Return a string containing a printable representation of an object. For many types, this function makes an attempt to return a string that would yield an object with the same value when passed to [`eval()`](https://docs.python.org/3/library/functions.html#eval), otherwise the representation is a string enclosed in angle brackets that contains the name of the type of the object together with additional information often including the name and address of the object. A class can control what this function returns for its instances by defining a [`__repr__()`](https://docs.python.org/3/reference/datamodel.html#object.__repr__) method.

- `.format()` allows for positional and keyword arguments

  ```python
  print('The story of {0}, {1}, and {other}.'.format('Bill', 'Manfred',
                                                         other='Georg'))
  ```




**Modules & Packages:**

- A python file is a module
- A folder that includes a `__init__.py` file is a package
- The import statement uses the following convention: if a package’s __init__.py code defines a list named __all__, it is taken to be the list of module names that should be imported when from package import * is encountered.
- When packages are structured into subpackages (as with the sound package in the example), you can use absolute imports to refer to submodules of siblings packages. For example, if the module sound.filters.vocoder needs to use the echo module in the sound.effects package, it can use from sound.effects import echo



- Exception handling notes:

  - >  If an exception occurs during execution of the try clause, the rest of the clause is skipped. Then if its type matches the exception named after the [`except`](https://docs.python.org/3/reference/compound_stmts.html#except) keyword, the except clause is executed, and then execution continues after the [`try`](https://docs.python.org/3/reference/compound_stmts.html#try) statement.

  - >  If an exception occurs which does not match the exception named in the except clause, it is passed on to outer [`try`](https://docs.python.org/3/reference/compound_stmts.html#try) statements; if no handler is found, it is an *unhandled exception* and execution stops with a message as shown above.

  - Avoid catch-all's, unless you just plan to log and re-raise

  - `else` can be added after `try`/`except` and will only run if no exception was raised in `try` clause

  - `finally` block is always executed 

  - `with` keyword allows using resources that provide cleanup-actions in a way in which they immediately clean themselves up when no longer used

    - [Classes can provide this capability by implementing `__enter__` and `__exit__` methods](http://preshing.com/20110920/the-python-with-statement-by-example/)



- `nonlocal` can be used to assign to a variable in an outer scope from within an inner scope. Without this keyword, Python would create a new local variable with the same name in the inner scope, instead of changing the value of the variable in the outer scope. `nonlocal` applies to all non-global variables; there's a separate `global` keyword to rebind global variables in a local scope (instead of redefining them).

- Sidenote: Useful cheatsheet for Python 2.7 + Python 3 compatible code, leveraging `future`: http://python-future.org/compatible_idioms.html Also useful: https://docs.python.org/3/howto/pyporting.html

- Sidenote 2: How numpy avoids the [global interpreter lock](https://wiki.python.org/moin/GlobalInterpreterLock): https://docs.python.org/3/howto/pyporting.html

  - As a result in cases on non-I/O heavy code, multiprocessing should always be preferred to multihreading, as GIL only allows one thread to interpret python code at a time: https://docs.python.org/3/library/multiprocessing.html

- In Python classes are objects, too and allow accessing attributes (members and functions)

- Instances have `data attributes` (instance variables in Swift); they don't need to / can't be declared, they come into existence upon assignment. If they have default values, these should be assigned in the initializer. Class variables can be defined but can also be created by assignment. 

- Data attributes override method attributes with the same name

- > […] classes are not usable to implement pure abstract data types. In fact, nothing in Python makes it possible to enforce data hiding — it is all based upon convention. 

- Types are stored in `object.__class__`

- All methods can be overriden

- Method of baseclass can be invoked in overriden method: 

  - ```
    BaseClassName.methodname(self, arguments)
    ```

  - For checking types, use `isinstance` or `issubclass`

- Python supports multiple inheritance; in most cases dynamic resolution uses depth-first, left-to-right search with respect to the specified base classes

  - Uses C3 algorithm for superclass lineriazation: https://en.wikipedia.org/wiki/C3_linearization
  - For some cases the method resolution order is more complicated; details defined here: https://www.python.org/download/releases/2.3/mro/
  - Order can be inspected via the `.mro()` property

- Sidenote on metaclasses:

  - Default metaclass in Python is `type` 

  - [Custom metatypes are possible](https://stackoverflow.com/questions/100003/what-is-a-metaclass-in-python):

    - > A metaclass is most commonly used as a class-factory. Like you create an instance of the class by calling the class, Python creates a new class (when it executes the 'class' statement) by calling the metaclass. Combined with the normal `__init__` and `__new__` methods, metaclasses therefore allow you to do 'extra things' when creating a class, like registering the new class with some registry, or even replace the class with something else entirely.

- By convention private class members are prefixed with an underscore: `_private_var`

- Members prefixed with 2 underscores are name-mangled with the class name: `__to_be_mangled`

- Methods store pointers to their object and function:

  - ```python
    >>> A().y.__self__
    <__main__.A object at 0x1063949b0>
    >>> A().y.__func__
    <function x at 0x10638bea0>
    ```

- Iterators:

  - Classes that want to implement the iterator protocol need to implement an `__iter__` method. That method needs to return an object that implements a `__next__` method (that method can be called via the builtin function `next()`). `__next__` needs to return items until iteration is complete at which point it needs to raise a `StopIteration` exception.

- Generators are the easiest way to create iterators. They are functions that use `yield` to pass data back to the caller.

  - ```python
    >>> def my_generator():
    ...      for c in 'abc':
    ...          yield c
    ...
    >>> for x in my_generator():
    ...     print(x)
    a
    b
    c
    ```

  - local variables and execution state are automatically saved between calls to `yield`

  - Generator expressions are similar to list comprehensions (but use parens instead of brackets) and can be used to create single expression generators, e.g.:

    - ```python
      sum(i*i for i in range(10))
      > 285
      ```

**Stdlib**

- `dir` and `help` can be used to inspect modules

- `shutil` provides high-level filesystem interaction APIs

- `glob` allows creating filelists from wildcard searches:

  - ```python
    >>> import glob
    >>> glob.glob('*.py')
    ['primes.py', 'random.py', 'quote.py']
    ```

- `timeit`, `profile` and `pstats` can be used for profiling

- **`doctest` is pretty cool!** combines docstrings with embedded unit tests 

- `locale` module for locale specific formatting

- `Template` can be used for sophisticated string formatting

- `queue` is preferred way for communication between threads

- `logging` module provides built-in logging API

- `weakref` can be used explicitly in cases where GC collection of cycles is not sufficient

- `array` allows storing homogenous data more compactly than in `list`

- `heapq` and `bisect` are there to help with sorting

- `decimal` module provides floating point type that allows specifying required accuracy, rounding and more







Not covered?

- Decorators
- Mixins
- Coroutines