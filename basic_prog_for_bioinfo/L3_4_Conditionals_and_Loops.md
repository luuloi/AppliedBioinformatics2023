# Conditionals and Loops

**Conditionals:**

1. *Conditional statements*, often referred to as 'if-else' statements, allow your code to **make decisions**. They perform different computations or actions depending on whether a specific boolean condition evaluates to `true` or `false`.

2. Common types of conditional statements include `if`, `elif` (else if), and `else` in Python, and `if`, `else if`, and `else` in R.

3. **Comparison operators** such as `==` (equal), `!=` (not equal), `<` (less than), `>` (greater than), `<=` (less than or equal to), and `>=` (greater than or equal to) are often used in the boolean conditions. 

  * Python

    ```python
    if x == y:
        print("x and y are equal")
    ```

  * R

    ```R
    if (x == y) {
        print("x and y are equal")
    }
    ```

4. **Logical operators** such as `and`, `or`, and `not` in Python, and `&`, `|`, and `!` in R, can be used to combine or invert boolean conditions.

  * Python
    
    ```python
    if x > 0 and y > 0:
        print("Both x and y are positive numbers")
    ```

  * R

    ```R
    if (x > 0 & y > 0) {
        print("Both x and y are positive numbers")
    }
    ```    
    
6. **Membership operators** such as `in` keyword in Python and the `%in%` operator in R check for membership or containment within a collection such as a list, tuple, or array. In Python, `in` is not limited to collections, it can also be used to check for substrings within a string. On the other hand, in R, we have to use `grepl` to check for substrings.

  * Python
    
    ```python
    # Check if an element exists in a list
    fruits = ["apple", "banana", "cherry"]
    if "banana" in fruits:
        print("Yes, 'banana' is in the fruits list.")
    ```

    ```python
    # Check if a substring in a string
    text = "Hello, world!"
    if "world" in text:
        print("Substring found.")
    ```

  * R
    
    ```r
    fruits <- c("apple", "banana", "cherry")
    if ("banana" %in% fruits) {
        print("Yes, 'banana' is in the fruits vector.")
    }
    ```

    ```r
    text <- "Hello, world!"
    if (grepl("world", text)) {
        print("Substring found.")
    }
    ```

  * Bash

    ```bash
    fruits=("apple" "banana" "cherry")
    
    contains() {
      local n=$#
      local value=${!n}
      for ((i=1;i < $#;i++)) {
        if [ "${!i}" == "${value}" ]; then
          echo "Yes, '${value}' is in the fruits array."
          return 0
        fi
      }
      return 1
    }
    
    contains "${fruits[@]}" "banana"
    ```
7. Conditional statements can be *nested*, meaning you can have `if-else` statements within `if-else` statements to check for further conditions.

**Loops:**

1. *Loops* are used to repeat a block of code multiple times. They are **essential** in programming as they help automate repetitive tasks.

2. Common types of loops include `for` and `while` loops. 

    ```python
    for i in range(10):
        print(i)
    ```

3. In a `for` loop, the block of code is executed for each element in a sequence (such as a list or range) or until a condition evaluates to false.

4. In a `while` loop, the block of code is executed as long as a specific condition remains true.

    ```python
    i = 0
    while i < 10:
        print(i)
        i += 1
    ```

5. Be mindful of *infinite loops* - these occur when the condition for a `while` loop never becomes false. To prevent this, make sure to include a statement within the loop that will eventually render the condition false.

6. **Loop control statements** like `break` and `continue` can alter the flow of a loop. `break` is used to exit the loop prematurely, while `continue` is used to skip the rest of the current iteration and move directly to the next one. The `break` statement in R is very similar to the `break` statement in Python, it terminates a loop entirely. The `next` statement in R is equivalent to `continue` in Python, it rejects all the remaining statements in the current iteration of the loop and moves the control back to the top of the loop for the next iteration.

    *Python Example:*
   
    ```python
    for i in range(10):
        if i == 5:
            break
        print(i)
    # Output: 1, 2, 3, 4
    ```

    ```python
    for num in range(10):
        if num == 5:
            continue
        print(num)
    # Output: 0, 1, 2, 3, 4, 6, 7, 8, 9
    ```

    *R Example:*

   ```r
   for (num in 1:10) {
       if (num == 6) {
           break
       }
       print(num)
   }
   # Output: 1, 2, 3, 4
   ```

   ```r
   for (num in 1:10) {
       if (num == 6) {
           next
       }
       print(num)
   }
   # Output: 0, 1, 2, 3, 4, 6, 7, 8, 9
   ```

  * Bash
    
    ```bash
    for i in {0..9}
    do
       echo $i
    done
    ```

    ```bash
    i=0
    while [ $i -lt 10 ]
    do
       echo $i
       ((i++))  # Increment i
    done
    ```

8. Loops can also be *nested*, meaning you can have loops within loops. This is useful when working with multi-dimensional data structures like matrices or nested lists.

Remember that understanding the concepts of conditionals and loops is foundational to learning how to program, and they are used in almost every piece of code, especially in bioinformatics where dealing with large amounts of data is common.

**DNA to RNA Transcription with `for` loop**

1. *Python Example:*

    ```python
    def dna_to_rna(dna_sequence):
        rna_sequence = ""
        for base in dna_sequence:
            if base == "T":
                rna_sequence += "U"
            else:
                rna_sequence += base
        return rna_sequence

    dna = "ATGCTAGCTAGC"
    print(f"DNA: {dna}")
    print(f"RNA: {dna_to_rna(dna)}")
    ```

2. *R Example:*

    ```r
    dna_to_rna <- function(dna_sequence) {
        rna_sequence <- ""
        for (i in seq_along(dna_sequence)) {
            if (substr(dna_sequence, i, i) == "T") {
                rna_sequence <- paste0(rna_sequence, "U")
            } else {
                rna_sequence <- paste0(rna_sequence, substr(dna_sequence, i, i))
            }
        }
        return(rna_sequence)
    }

    dna <- "ATGCTAGCTAGC"
    cat(paste("DNA: ", dna, "\n"))
    cat(paste("RNA: ", dna_to_rna(dna), "\n"))
    ```

**DNA to RNA Transcription with functional programming**

1. *Python Example - using `str` method `replace()`:*

    ```python
    def dna_to_rna(dna_sequence):
        rna_sequence = dna_sequence.replace('T', 'U')
        return rna_sequence

    dna = "ATGCTAGCTAGC"
    print(f"DNA: {dna}")
    print(f"RNA: {dna_to_rna(dna)}")
    ```

2. *R Example - using `chartr` function:*

    ```r
    dna_to_rna <- function(dna_sequence) {
        rna_sequence <- chartr("T", "U", dna_sequence)
        return(rna_sequence)
    }

    dna <- "ATGCTAGCTAGC"
    cat(paste("DNA: ", dna, "\n"))
    cat(paste("RNA: ", dna_to_rna(dna), "\n"))
    ```

**Calculating GC content with `while` loop**

1. *Python Example:*

    ```python
    def calculate_gc_content(dna_sequence):
        length = len(dna_sequence)
        gc_count = 0
        index = 0
        while index < length:
            if dna_sequence[index] in 'GCgc':
                gc_count += 1
            index += 1
        return gc_count / length * 100

    dna = "ATGCTAGCTAGC"
    print(f"DNA: {dna}")
    print(f"GC content: {calculate_gc_content(dna)}%")
    ```

2. *R Example:*

    ```r
    calculate_gc_content <- function(dna_sequence) {
        length <- nchar(dna_sequence)
        gc_count <- 0
        index <- 1
        while (index <= length) {
            if (substr(dna_sequence, index, index) %in% c("G", "C", "g", "c")) {
                gc_count <- gc_count + 1
            }
            index <- index + 1
        }
        return (gc_count / length * 100)
    }

    dna <- "ATGCTAGCTAGC"
    cat(paste("DNA: ", dna, "\n"))
    cat(paste("GC content: ", calculate_gc_content(dna), "%\n"))
    ```

**Calculating GC content with functional programming**

1. *Python Example - using `str` method `count()`:*

    ```python
    def calculate_gc_content(dna_sequence):
        length = len(dna_sequence)
        gc_count = dna_sequence.count('G') + dna_sequence.count('C') + dna_sequence.count('g') + dna_sequence.count('c')
        return gc_count / length * 100

    dna = "ATGCTAGCTAGC"
    print(f"DNA: {dna}")
    print(f"GC content: {calculate_gc_content(dna)}%")
    ```

2. *R Example - using package `stringr`:*

    ```r
    calculate_gc_content <- function(dna_sequence) {
        length <- nchar(dna_sequence)
        gc_count <- stringr::str_count(dna_sequence, "[Gg]") + stringr::str_count(dna_sequence, "[Cc]")
        return (gc_count / length * 100)
    }

    dna <- "ATGCTAGCTAGC"
    cat(paste("DNA: ", dna, "\n"))
    cat(paste("GC content: ", calculate_gc_content(dna), "%\n"))
    ```
