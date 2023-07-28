# THIS SCRIPT SHOWS SOME METHODS TO IMPORT DATA IN R

# set workdir
setwd("/home/hoangnguyen/Documents/data_visualization")
getwd() # check workdir

# 1. the file is txt format
data_1 <- read.table("data/other_data/text.txt", sep = "\t", header = T, check.names = F)
data_2 <- read.table("data/other_data/smoking.txt",sep ="\t",header=T,check.names = F) 
head(data_2)

# 2. the file is csv format 
data_3 <- read.csv("data/other_data/prawnGR.CSV",sep=",")
head(data_3)
dt <- read.table("data/other_data/prawnGR.CSV",sep=",")
dt
# 3. the file is tsv
data_4 <- read.delim("data/other_data/Petal.Length.tsv", sep="\t")
head(data_4)

# 4. the file is 
install.packages("xlsx")
library(xlsx)
data_4 <- read_excel("data/other_data/whaledata.xls", sheet = 1)


# data.table packages
library(data.table)
data_5 <- as.data.frame(fread("data/other_data/Petal.Length.tsv"))
data_5
data_6 <- as.data.frame(fread("data/other_data/children.txt"))
data_6
data_7 <- as.data.frame(fread("data/other_data/Gigartina.CSV"))
data_7


# Read multi files in R using apply and reduce
## list path of all file
list_file <- list.files("data/multi_files", pattern = ".tsv", full.names = T)

# read all files
read_file <- lapply(list_file, function(x) read.delim(x, header = T, sep = "\t"))

# merge all files
data <- Reduce(function(x, y) merge(x, y, by = "ID"), read_file)

# Remove duplicate species column
data_rm <- data[!duplicated(as.list(data))]

# save the data
write.table(data_rm, paste0("output", "/newdata.tsv"), col.names = T, row.names = F, sep = "\t", quote = F)