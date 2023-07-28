# This script for discover, generate and edit for data types in R
# There are five data types in R programming
# 1. numeric (double) - (10.5, 55, 787)
num <- 2.2
class(num)
is.numeric(num)
typeof(num)

# 2. integer - (1L, 55L, 100L, where the letter "L" declares this as an integer)
a <- 1L
test <- 1
class(a)
class(test)
is.numeric(a)
typeof(a)


# 3. complex - (9 + 3i, where "i" is the imaginary part)
b <- 3i
class(b)
is.numeric(b)
typeof(b)

# 4. character (a.k.a. string) - ("k", "R is exciting", "FALSE", "11.5")
strings <- "programming"
class(strings)
is.character(strings)
typeof(strings)


# 5. logical (a.k.a. boolean) - (TRUE or FALSE)
c <- TRUE
d <- F
e <- 'f'
class(e)
class(c)
class(d)
is.logical(c)
is.logical(d)
typeof(c)
typeof(d)

# coerce numeric to character
class(num)
num_char <- as.character(num)
num_char
class(num_char)
is.numeric(num)

logic <- T
logic_num <- as.numeric(logic)
class(logic)
class(logic_num)
logic_num

# Basic arithmetic and variable assignment
# power
2^4
# inerger devide
2/2
5/2
5%%2
5%/%2

# Comparison and logical operators
num_1 = 5
num_2 = 4
num_3 = 6

num_1 == num_2
num_1 != num_2

num_1 > num_2 & num_1 > num_3
num_1 > num_2 | num_1 > num_3

