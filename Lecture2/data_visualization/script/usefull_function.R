# This script introduces some useful functions in R

# Section 1: Create Multiple Files
# The following code is commented out. If run, it would split the iris dataset into multiple files.
# iris$ID <- paste0("ID_",seq(1:nrow(iris)))  # Add ID column to iris dataset
# head(iris)  # Display first few rows of the data
# for (i in 1:4) {
#     data_save <- iris[c(6,5, i)]  # Subset the data
#     write.table(data_save, paste0("data/multi_files", "/", colnames(iris)[i], ".tsv"), col.names = T, row.names = F, sep = "\t", quote = F)  # Save each subset of data to a .tsv file
# }

# Section 2: Set Working Directory
setwd("/home/ds02/Documents/data_visualization")  # Set the working directory

# Section 3: Melt Function in Reshape2
library(reshape2)  # Load reshape2 package
w_data <- data.frame(  # Create a data frame
    team = c("A", "B", "C", "D"),
    points = c(88, 91, 99, 94),
    assists = c(12, 17, 24, 28),
    rebounds = c(22, 28, 30, 31)
)
w_data  # Display the data
long_df <- melt(w_data, id = "team")  # Melt the data to a long format
head(long_df)  # Display first few rows of the long format data

rw_data <- dcast(long_df, team ~ variable)  # Cast the long format data back to wide format
rw_data  # Display the data

# Section 4: do.call vs. Reduce
x <- 1:10  # Create a numeric vector
x  # Display the vector
# Reduce function applies a function to the first two elements of the vector, then to the result and the next element, and so on
Reduce(sum, x)  # Use Reduce to sum the elements of the vector

# do.call constructs and executes a function call from a name or a function and a list of arguments to be passed to it
do.call(sum, list(x))  # Use do.call to sum the elements of the vector

# The Reduce and do.call functions can also take user-defined anonymous functions as arguments
# The anonymous function takes two arguments A and B, and returns the sum of A and B
Reduce(function(A, B) sum(c(A, B)), x)  # Use Reduce with an anonymous function to sum the elements of the vector
do.call(function(A, B) sum(c(A, B)), list(x))  # Use do.call with an anonymous function to sum the elements of the vector

# Here, Reduce is used with a function that takes three arguments. However, this will return an error since Reduce expects a binary function.
# Uncommenting the following line will result in an error
# Reduce(function(A, B, C) sum(c(A, B, C)), x)  # Use Reduce with an anonymous function that takes three arguments to sum the elements of the vector
