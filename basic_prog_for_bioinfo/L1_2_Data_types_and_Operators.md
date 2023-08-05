**Exploring various Data Types**

1. *Python Example:*

    ```python
    # Integer
    x = 10
    print(f"x is of {type(x)} and its value is {x}")

    # Floating Point
    y = 10.5
    print(f"y is of {type(y)} and its value is {y}")

    # String
    z = "Bioinformatics"
    print(f"z is of {type(z)} and its value is {z}")

    # Boolean
    a = True
    print(f"a is of {type(a)} and its value is {a}")
    ```

2. *R Example:*

    ```r
    # Numeric (which includes both integer and floating point in R)
    x <- 10
    cat(paste("x is of ", class(x), " type and its value is ", x, "\n"))

    y <- 10.5
    cat(paste("y is of ", class(y), " type and its value is ", y, "\n"))

    # Character
    z <- "Bioinformatics"
    cat(paste("z is of ", class(z), " type and its value is ", z, "\n"))

    # Logical
    a <- TRUE
    cat(paste("a is of ", class(a), " type and its value is ", a, "\n"))
    ```

**Applying Operators**

1. *Python Example:*

    ```python
    x = 10
    y = 20

    # Arithmetic Operators
    print(f"Addition: {x + y}")
    print(f"Subtraction: {x - y}")
    print(f"Multiplication: {x * y}")
    print(f"Division: {x / y}")
    print(f"Modulus: {y % x}")

    # Comparison Operators
    print(f"Is x less than y? : {x < y}")

    # Logical Operators
    print(f"Logical AND: {x < y and x > 0}")
    print(f"Logical OR: {x > y or x > 0}")
    print(f"Logical NOT: {not(x < y)}")
    ```

2. *R Example:*

    ```r
    x <- 10
    y <- 20

    # Arithmetic Operators
    cat(paste("Addition: ", x + y, "\n"))
    cat(paste("Subtraction: ", x - y, "\n"))
    cat(paste("Multiplication: ", x * y, "\n"))
    cat(paste("Division: ", x / y, "\n"))
    cat(paste("Modulus: ", y %% x, "\n"))

    # Comparison Operators
    cat(paste("Is x less than y? : ", x < y, "\n"))

    # Logical Operators
    cat(paste("Logical AND: ", x < y & x > 0, "\n"))
    cat(paste("Logical OR: ", x > y | x > 0, "\n"))
    cat(paste("Logical NOT: ", !(x < y), "\n"))
    ```

**Distinctive Features: Python**

1. In Python, a string is iterable and can be handled in many ways similar to a list.

    ```python
    # String repetition
    print('x' * 30)

    # String slicing
    z = "Bioinformatics"
    print(z[0:4])  # prints "Bioi"

    # Iterating through a string
    for char in z:
        print(char)
    ```

2. Python has built-in data types such as sets and dictionaries, which can be very useful for certain tasks. 

    ```python
    # Sets: an unordered collection of unique elements
    s = set([1, 2, 3, 2, 1])
    print(s)  # prints {1, 2, 3}

    # Dictionaries: a collection of key-value pairs
    d = {'name': 'Alice', 'age': 25}
    print(d)  # prints {'name': 'Alice', 'age': 25}
    ```

3. Python has list comprehension, which is a powerful feature that allows you to create lists in a very concise way.

    ```python
    # List comprehension
    x = [i**2 for i in range(10)]
    print(x)  # prints [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
    ```

**Distinctive Features: R**

1. R does not treat strings as iterable objects in the same way Python does. However, R excels in vectorized operations and statistical functions.

    ```r
    # Vectorized operation
    x <- c(1, 2, 3, 4, 5)
    y <- x * 2  # Multiplies every element in the vector by 2
    print(y)
    ```

2. R's factor data type is a powerful feature for statistical modeling and is not found in Python.

    ```r
    # Factor: used to categorize data and store it as levels
    g <- factor(c("Male", "Female", "Female", "Male", "Male"))
    print(g)
    ```

3. In R, everything is an object and can be passed into functions. This is useful in many statistical applications.

    ```r
    # Everything is an object
    x <- c(1, 2, 3, 4, 5)
    print(mean(x))  # Computes the mean of the vector x
    ```

**Note on printf-style String Formatting**

In both Python and R, there is a functionality for printf-style string formatting, which originates from the C programming language's `printf` function. This allows us to insert the values of variables into strings in a formatted manner.

1. *Python Example:*

    ```python
    name = "Alice"
    age = 25

    # Using printf-style formatting
    print("My name is %s and I'm %d years old." % (name, age))

    # Controlling the number of decimal places
    pi = 3.14159
    print("Pi to 2 decimal places: %.2f" % pi)

    # Padding numbers with zeros
    number = 5
    print("Number padded with zeros: %05d" % number)

    # Adjusting the alignment
    text = "Hello"
    print("Right aligned text: %10s" % text)
    ```

2. *R Example:*

    ```r
    name <- "Alice"
    age <- 25

    # Using printf-style formatting
    cat(sprintf("My name is %s and I'm %d years old.\n", name, age))
    ```

In these printf-style formatting strings, `%s` stands for a string, `%d` stands for an integer, and `%f` stands for a floating-point number. There are many more such format specifiers, allowing you to control how the variable's value should be formatted. This can be very useful in many scenarios, such as generating dynamic messages, formatting output for better readability, and more. In the context of bioinformatics, you might find this useful for generating dynamic filenames, log messages, or output data.
