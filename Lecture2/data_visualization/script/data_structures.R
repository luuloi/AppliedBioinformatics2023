# This script for discover, generate and edit for data structures in R

# 1. Scalar 
sc <- 1
length(sc)
class(sc)

# 2. Vector
## Numeric vectors
a <- c(1, 2, 3, 4, 5:10)
a
length(a)
class(a)
str(a)

## Character vectors
b <- c("A", "B", "C", "D")
b
length(b)
class(b)
str(b)


## Combining vectors
e <- c(a, b)
e

# 3. Matrix
my_mat <- matrix(1:16, nrow = 4, byrow = TRUE)
my_mat[1,]


my_array <- array(1:16, dim = c(2, 4, 2))
my_array

## add colnames and rownames
rownames(my_mat) <- c("A", "B", "C", "D")
colnames(my_mat) <- c("a", "b", "c", "d")
my_mat

# 4. List 
list_1 <- list(
    c("black", "yellow", "orange"),
    c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE),
    matrix(1:6, nrow = 3)
)
list_1


list_2 <- list(
    colours = c("black", "yellow", "orange"),
    evaluation = c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE),
    time = matrix(1:6, nrow = 3)
)
list_2

# 5. Data frame
p.height <- c(180, 155, 160, 167, 181)
p.weight <- c(65, 50, 52, 58, 70)
p.names <- c("Joanna", "Charlotte", "Helen", "Karen", "Amy")

dataf <- data.frame(height = p.height, weight = p.weight, names = p.names)
dataf

## discover dataframe 
dim(dataf)
str(dataf)
colnames(dataf)
dataf[1,]


#6 Remove NA
Name <- c("Tuan", "Nhan", "Ngoc", "Tien", "Kien")
Height <- c(1.63, 1.78, 1.60, 1.56, NA)
Weight <- c(60, 72, 58, NA, NA)
df <- data.frame(Name, Height, Weight)
df
na.omit(df)
complete.cases(df)
df[complete.cases(df), ]
table(is.na(df))
df[rowSums(is.na(df)) == 0, ]
rowSums(is.na(df)) == 0

