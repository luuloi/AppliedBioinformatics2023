# This script is for discovering, generating, and editing data types in R programming

# Section 1: Numeric (double)
num <- 2.2  # Define a numeric (double) variable
class(num)  # Get the class of the variable
is.numeric(num)  # Check if the variable is numeric
typeof(num)  # Get the type of the variable

# Section 2: Integer
a <- 1L  # Define an integer variable
test <- 1  # Define a numeric (double) variable
class(a)  # Get the class of the integer variable
class(test)  # Get the class of the numeric variable
is.numeric(a)  # Check if the integer variable is numeric
typeof(a)  # Get the type of the integer variable

# Section 3: Complex
b <- 3i  # Define a complex variable
class(b)  # Get the class of the complex variable
is.numeric(b)  # Check if the complex variable is numeric
typeof(b)  # Get the type of the complex variable

# Section 4: Character (string)
strings <- "programming"  # Define a character (string) variable
class(strings)  # Get the class of the string variable
is.character(strings)  # Check if the variable is a string
typeof(strings)  # Get the type of the string variable

# Section 5: Logical (boolean)
c <- TRUE  # Define a logical (boolean) variable
d <- F  # Define a logical variable using the shorthand for FALSE
e <- 'f'  # Define a character variable with the letter 'f'
class(e)  # Get the class of the character variable
class(c)  # Get the class of the logical variable
class(d)  # Get the class of the logical variable
is.logical(c)  # Check if the variable is logical
is.logical(d)  # Check if the variable is logical
typeof(c)  # Get the type of the logical variable
typeof(d)  # Get the type of the logical variable

# Section 6: Coercion of data types
num_char <- as.character(num)  # Coerce numeric to character
class(num_char)  # Get the class of the new character variable
is.numeric(num)  # Check if the original variable is numeric

logic <- T  # Define a logical variable using the shorthand for TRUE
logic_num <- as.numeric(logic)  # Coerce logical to numeric
class(logic)  # Get the class of the logical variable
class(logic_num)  # Get the class of the numeric variable
logic_num  # Print the numeric variable

# Section 7: Basic arithmetic and variable assignment
2^4  # Power operation
2/2  # Division operation
5/2  # Division operation
5%%2  # Modulus operation
5%/%2  # Integer division operation

# Section 8: Comparison and logical operators
num_1 = 5  # Assign a value to num_1
num_2 = 4  # Assign a value to num_2
num_3 = 6  # Assign a value to num_3

num_1 == num_2  # Equality comparison between num_1 and num_2
num_1 != num_2  # Inequality comparison between num_1 and num_2

num_1 > num_2 & num_1 > num_3  # Logical AND operation between two comparisons
num_1 > num_2 | num_1 > num_3  # Logical OR operation between two comparisons
