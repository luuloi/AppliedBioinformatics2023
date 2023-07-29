# This script is for discovering, generating and editing data structures in R

# 1. Scalar 
sc <- 1 # Define a scalar (single value) and examine its length and type
length(sc) # Get length of scalar
class(sc) # Get class of scalar

# 2. Vector
## Numeric vectors
a <- c(1, 2, 3, 4, 5:10) # Create a numeric vector using the combine function c()
a # Display the vector
length(a) # Display the length of the vector
class(a) # Display the class (type) of the vector
str(a) # Use the str() function to compactly display the structure of the vector

## Character vectors
b <- c("A", "B", "C", "D") # Create character vector
b # Display the vector
length(b) # Display the length of the vector
class(b) # Display the class (type) of the vector
str(b) # Display the structure of the vector

## Combining vectors
e <- c(a, b) # Combine the numeric vector 'a' and character vector 'b' into a new vector 'e'
e # Display the combined vector

# 3. Matrix
my_mat <- matrix(1:16, nrow = 4, byrow = TRUE) # Create a 4x4 matrix with elements 1 to 16 filled by row
my_mat[1,] # Access and display the first row of the matrix

my_array <- array(1:16, dim = c(2, 4, 2)) # Create a 3-dimensional array with dimensions 2x4x2
my_array # Display the array

## Add colnames and rownames
rownames(my_mat) <- c("A", "B", "C", "D") # Set the row names 
colnames(my_mat) <- c("a", "b", "c", "d") # Set the column names 
my_mat # Display the matrix with row names and column names

# 4. List 
# Create a list with 3 elements: a character vector, a logical vector, and a matrix
list_1 <- list(
    c("black", "yellow", "orange"),
    c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE),
    matrix(1:6, nrow = 3)
)
# Display the list
list_1

# Create a named list
list_2 <- list(
    colours = c("black", "yellow", "orange"),
    evaluation = c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE),
    time = matrix(1:6, nrow = 3)
)
list_2 # Display the named list

# 5. Data frame
# Create vectors for height, weight, and names
p.height <- c(180, 155, 160, 167, 181)
p.weight <- c(65, 50, 52, 58, 70)
p.names <- c("Joanna", "Charlotte", "Helen", "Karen", "Amy")

# Create a data frame using these vectors
dataf <- data.frame(height = p.height, weight = p.weight, names = p.names)
dataf # Display the data frame

## Discover dataframe 
dim(dataf) # Show the dimensions of the data frame (number of rows and columns)
str(dataf) # Show the structure of the data frame
colnames(dataf) # Show the column names of the data frame
dataf[1,] # Show the first row of the data frame

# 6. Remove NA
# Create a dataframe with some NA (missing) values
Name <- c("Tuan", "Nhan", "Ngoc", "Tien", "Kien")
Height <- c(1.63, 1.78, 1.60, 1.56, NA)
Weight <- c(60, 72, 58, NA, NA)
df <- data.frame(Name, Height, Weight)

df # Display the dataframe
na.omit(df) # Remove rows with any NA values
complete.cases(df) # Return a logical vector indicating which cases are complete (no NA values)
df[complete.cases(df), ] # Use logical indexing to show only complete cases
table(is.na(df)) # Count the number of NA and non-NA values in the dataframe
df[rowSums(is.na(df)) == 0, ] # Use logical indexing to show rows with no NA values
rowSums(is.na(df)) == 0 # Return a logical vector where TRUE indicates rows with no NA values
