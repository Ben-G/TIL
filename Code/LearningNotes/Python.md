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




- Exception handling notes:

  - >  If an exception occurs during execution of the try clause, the rest of the clause is skipped. Then if its type matches the exception named after the [`except`](https://docs.python.org/3/reference/compound_stmts.html#except) keyword, the except clause is executed, and then execution continues after the [`try`](https://docs.python.org/3/reference/compound_stmts.html#try) statement.

  - >  If an exception occurs which does not match the exception named in the except clause, it is passed on to outer [`try`](https://docs.python.org/3/reference/compound_stmts.html#try) statements; if no handler is found, it is an *unhandled exception* and execution stops with a message as shown above.

  - Avoid catch-all's, unless you just plan to log and re-raise

  - `else` can be added after `try`/`except` and will only run if no exception was raised in `try` clause