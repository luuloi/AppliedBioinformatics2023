# This script demonstrates various methods to import data in R

# Section 1: Set Working Directory
setwd("/home/hoangnguyen/Documents/data_visualization")  # Set working directory
getwd()  # Check working directory

# Section 2: Import .txt Files
data_1 <- read.table("data/other_data/text.txt", sep = "\t", header = T, check.names = F)  # Import .txt file
data_2 <- read.table("data/other_data/smoking.txt", sep ="\t", header = T, check.names = F)  # Import another .txt file
head(data_2)  # Display first few rows of the data

# Section 3: Import .CSV Files
data_3 <- read.csv("data/other_data/prawnGR.CSV", sep=",")  # Import .CSV file
head(data_3)  # Display first few rows of the data
dt <- read.table("data/other_data/prawnGR.CSV", sep=",")  # Import .CSV file using read.table()
dt  # Display the data

# Section 4: Import .tsv Files
data_4 <- read.delim("data/other_data/Petal.Length.tsv", sep="\t")  # Import .tsv file
head(data_4)  # Display first few rows of the data

# Section 5: Import .xls Files
install.packages("xlsx")  # Install the 'xlsx' package
library(xlsx)  # Load the 'xlsx' package
data_4 <- read_excel("data/other_data/whaledata.xls", sheet = 1)  # Import .xls file

# Section 6: Using data.table Package
library(data.table)  # Load the 'data.table' package
data_5 <- as.data.frame(fread("data/other_data/Petal.Length.tsv"))  # Import .tsv file using fread()
data_5  # Display the data
data_6 <- as.data.frame(fread("data/other_data/children.txt"))  # Import .txt file using fread()
data_6  # Display the data
data_7 <- as.data.frame(fread("data/other_data/Gigartina.CSV"))  # Import .CSV file using fread()
data_7  # Display the data

# Section 7: Read Multiple Files in R Using apply and reduce
list_file <- list.files("data/multi_files", pattern = ".tsv", full.names = T)  # List all .tsv files in the directory

read_file <- lapply(list_file, function(x) read.delim(x, header = T, sep = "\t"))  # Read all files using lapply()

data <- Reduce(function(x, y) merge(x, y, by = "ID"), read_file)  # Merge all files using Reduce()

data_rm <- data[!duplicated(as.list(data))]  # Remove duplicate rows

# Section 8: Save the Data
write.table(data_rm, paste0("output", "/newdata.tsv"), col.names = T, row.names = F, sep = "\t", quote = F)  # Save the data to a .tsv file
