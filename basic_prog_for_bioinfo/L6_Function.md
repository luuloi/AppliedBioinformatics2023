* Python

In Python, the `def` keyword is used to define (declare) a function. Functions can accept zero or more parameters, and they can return a value using the return statement.

```python
def greet(name):
    return "Hello, " + name + "!"

result = greet("Alice")
print(result)  # Outputs: Hello, Alice!
```

In Python, the `yield` keyword is used in functions to turn them into generators. Generators are iterators that produce a sequence of values lazily, on-the-fly, and can be paused and resumed. This allows for more memory-efficient iteration, especially when dealing with large data sets.

Instead of returning a result once, yield produces a series of values over time. Each time a generator's `__next__()` or `next()` method is invoked, the function runs until it encounters a yield statement, at which point it returns the yielded value and suspends execution until the next value is requested.

```python
def count_up_to(n):
    count = 1
    while count <= n:
        yield count
        count += 1

counter = count_up_to(5)
print(next(counter))  # Outputs: 1
print(next(counter))  # Outputs: 2
# ... and so on until 5
```

* R

In R, functions are objects themselves and can be assigned to variables. The `function` keyword is used to define a function.

```r
greet <- function(name) {
    # This function takes a name as an argument and returns a greeting string.
    return(paste("Hello,", name, "!"))
}

result <- greet("Alice")
print(result)  # Outputs: Hello, Alice !
```

In R, there isn't a direct equivalent to Python's `yield`. However, similar behavior can be mimicked using the `R6` class system to create iterators. While this isn't as straightforward as Python's generators, it serves the purpose.

```r
library(R6)

Counter <- R6Class("Counter",
  private = list(
    count = 1,
    max = NULL
  ),
  public = list(
    initialize = function(n) {
      private$max <- n
    },
    next = function() {
      if (private$count <= private$max) {
        val <- private$count
        private$count <- private$count + 1
        return(val)
      } else {
        stop("Counter exceeded!")
      }
    }
  )
)

counter <- Counter$new(5)
print(counter$next())  # Outputs: 1
print(counter$next())  # Outputs: 2
# ... and so on until 5
```


* Bash

Bash functions are blocks of code that can be reused and executed in scripts. The `function` keyword is optional when declaring a function. Functions in Bash do not return values in the same way as in Python and R. Instead, they can echo a result and return exit statuses (0 for success, non-zero for failure).

```bash
function greet {
    local name=$1  # Declare a local variable 'name' and assign the first argument to it
    echo "Hello, $name!"  # This will print the greeting directly
}

# Capture the output of the function in a variable using command substitution
result=$(greet "Alice")
echo $result  # Outputs: Hello, Alice!
```

In the Bash example, $1 represents the first argument passed to the function. Command substitution ($(...)) is used to capture the output of the function into a variable.

Bash does not have a direct equivalent to the yield statement in Python. However, you can somewhat emulate the behavior by printing values within loops and using constructs like process substitution or pipes to process the data iteratively.

For example, consider a function that produces numbers up to a given limit:

```bash
produce_numbers() {
    local limit=$1
    for ((i=1; i<=limit; i++)); do
        echo $i
    done
}

# Usage
produce_numbers 5 | while read -r number; do
    echo "Processing number: $number"
done
```
