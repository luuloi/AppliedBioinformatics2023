# This script is for discovering, generating, and editing data types in Python programming

# Section 1: Numeric (float and int)
num = 2.2  # Define a numeric (float) variable
print(type(num))  # Get the type of the variable

a = 1  # Define an integer variable
test = 1.0  # Define a numeric (float) variable
print(type(a))  # Get the type of the integer variable
print(type(test))  # Get the type of the numeric variable

# Section 2: Complex
b = 3j  # Define a complex variable
print(type(b))  # Get the type of the complex variable

# Section 3: String
strings = "programming"  # Define a string variable
print(type(strings))  # Get the type of the string variable

# Section 4: Boolean
c = True  # Define a boolean variable
d = False  # Define a boolean variable using the keyword FALSE
e = 'f'  # Define a string variable with the letter 'f'
print(type(e))  # Get the type of the string variable
print(type(c))  # Get the type of the boolean variable
print(type(d))  # Get the type of the boolean variable

# Section 5: Coercion of data types
num_char = str(num)  # Coerce numeric to string
print(type(num_char))  # Get the type of the new string variable

logic = True  # Define a boolean variable
logic_num = int(logic)  # Coerce boolean to integer
print(type(logic))  # Get the type of the boolean variable
print(type(logic_num))  # Get the type of the integer variable
print(logic_num)  # Print the integer variable

# Section 6: Basic arithmetic and variable assignment
print(2**4)  # Power operation
print(2/2)  # Division operation
print(5/2)  # Division operation
print(5%2)  # Modulus operation
print(5//2)  # Integer division operation

# Section 7: Comparison and logical operators
num_1 = 5  # Assign a value to num_1
num_2 = 4  # Assign a value to num_2
num_3 = 6  # Assign a value to num_3

print(num_1 == num_2)  # Equality comparison between num_1 and num_2
print(num_1 != num_2)  # Inequality comparison between num_1 and num_2

print(num_1 > num_2 and num_1 > num_3)  # Logical AND operation between two comparisons
print(num_1 > num_2 or num_1 > num_3)  # Logical OR operation between two comparisons
