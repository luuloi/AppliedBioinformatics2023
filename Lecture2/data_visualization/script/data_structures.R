# This script is for discovering, generating, and editing data structures in R

# Section 1: Scalar
sc <- 1  # Define a scalar
length(sc)  # Get length of scalar
class(sc)  # Get class of scalar

# Section 2: Vector
a <- c(1, 2, 3, 4, 5:10)  # Create a numeric vector
a  # Display the vector
length(a)  # Display the length of the vector
class(a)  # Display the class of the vector
str(a)  # Display the structure of the vector

b <- c("A", "B", "C", "D")  # Create a character vector
b  # Display the vector
length(b)  # Display the length of the vector
class(b)  # Display the class of the vector
str(b)  # Display the structure of the vector

e <- c(a, b)  # Combine the numeric vector 'a' and character vector 'b' into a new vector 'e'
e  # Display the combined vector

# Section 3: Matrix
my_mat <- matrix(1:16, nrow = 4, byrow = TRUE)  # Create a 4x4 matrix
my_mat[1,]  # Access and display the first row of the matrix

my_array <- array(1:16, dim = c(2, 4, 2))  # Create a 3-dimensional array
my_array  # Display the array

rownames(my_mat) <- c("A", "B", "C", "D")  # Set the row names 
colnames(my_mat) <- c("a", "b", "c", "d")  # Set the column names 
my_mat  # Display the matrix with row names and column names

# Section 4: List
list_1 <- list(
    c("black", "yellow", "orange"),
    c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE),
    matrix(1:6, nrow = 3)
)  # Create a list
list_1  # Display the list

list_2 <- list(
    colours = c("black", "yellow", "orange"),
    evaluation = c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE),
    time = matrix(1:6, nrow = 3)
)  # Create a named list
list_2  # Display the named list

# Section 5: Data Frame
p.height <- c(180, 155, 160, 167, 181)  # Create a vector for height
p.weight <- c(65, 50, 52, 58, 70)  # Create a vector for weight
p.names <- c("Joanna", "Charlotte", "Helen", "Karen", "Amy")  # Create a vector for names

dataf <- data.frame(height = p.height, weight = p.weight, names = p.names)  # Create a data frame using the vectors
dataf  # Display the data frame

dim(dataf)  # Show the dimensions of the data frame
str(dataf)  # Show the structure of the data frame
colnames(dataf)  # Show the column names of the data frame
dataf[1,]  # Show the first row of the data frame

# Section 6: Handle Missing Values
Name <- c("Tuan", "Nhan", "Ngoc", "Tien", "Kien")  # Create a vector for names
Height <- c(1.63, 1.78, 1.60, 1.56, NA)  # Create a vector for height with a missing value
Weight <- c(60, 72, 58, NA, NA)  # Create a vector for weight with missing values

df <- data.frame(Name, Height, Weight)  # Create a data frame with missing values
df  # Display the data frame

na.omit(df)  # Remove rows with any missing values
complete.cases(df)  # Get complete cases (no missing values)
df[complete.cases(df), ]  # Display only complete cases
table(is.na(df))  # Count the number of missing and non-missing values
df[rowSums(is.na(df)) == 0, ]  # Display rows with no missing values
rowSums(is.na(df)) == 0  # Get a logical vector indicating rows with no missing values
