# THIS SCRIPT INTRODUCE SOME USEFULL FUNCTION IN R #
# create mutli files
# iris$ID <- paste0("ID_",seq(1:nrow(iris)))
# head(iris)
# for (i in 1:4) {
#     data_save <- iris[c(6,5, i)]
#     write.table(data_save, paste0("data/multi_files", "/", colnames(iris)[i], ".tsv"), col.names = T, row.names = F, sep = "\t", quote = F)
# }

# set workdir
setwd("/home/ds02/Documents/data_visualization")

# melt and function in reshape2
library(reshape2)
w_data <- data.frame(
    team = c("A", "B", "C", "D"),
    points = c(88, 91, 99, 94),
    assists = c(12, 17, 24, 28),
    rebounds = c(22, 28, 30, 31)
)
w_data
long_df <- melt(w_data, id = "team")
head(long_df)

rw_data <- dcast(long_df, team ~ variable)
rw_data

# do.call vs. reduce
x <- 1:10
x
Reduce(sum, x)
do.call(sum, list(x))
Reduce(function(A, B) sum(c(A, B)), x)
do.call(function(A, B) sum(c(A, B)), list(x))
Reduce(function(A, B, C) sum(c(A, B, C)), x)



