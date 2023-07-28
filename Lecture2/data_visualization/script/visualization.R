# THIS SCRIPT TO VISULIAZTION IN BASE PLOT IN R

# loading library
library(ggplot2)
library(reshape2)
library(vioplot)
library(ggpubr)
library(ggdist)

# setup workdir
setwd("/home/ds02/Documents/data_visualization")
getwd()

# 1. Import data
data <- read.csv("data/Heart_Disease_Prediction.csv")
dim(data)
head(data)

## structure of data
str(data)
# 'data.frame':   270 obs. of  15 variables:
#  $ index                  : int  0 1 2 3 4 5 6 7 8 9 ...
#  $ Age                    : int  70 67 57 64 74 65 56 59 60 63 ...
#  $ Sex                    : int  1 0 1 1 0 1 1 1 1 0 ...
#  $ Chest.pain.type        : int  4 3 2 4 2 4 3 4 4 4 ...
#  $ BP                     : int  130 115 124 128 120 120 130 110 140 150 ...
#  $ Cholesterol            : int  322 564 261 263 269 177 256 239 293 407 ...
#  $ FBS.over.120           : int  0 0 0 0 0 0 1 0 0 0 ...
#  $ EKG.results            : int  2 2 0 0 2 0 2 2 2 2 ...
#  $ Max.HR                 : int  109 160 141 105 121 140 142 142 170 154 ...
#  $ Exercise.angina        : int  0 0 0 1 1 0 1 1 0 0 ...
#  $ ST.depression          : num  2.4 1.6 0.3 0.2 0.2 0.4 0.6 1.2 1.2 4 ...
#  $ Slope.of.ST            : int  2 2 1 2 1 1 2 2 2 2 ...
#  $ Number.of.vessels.fluro: int  3 0 0 1 1 0 1 1 2 3 ...
#  $ Thallium               : int  3 7 7 7 3 7 6 7 7 7 ...
#  $ Heart.Disease          : chr  "Presence" "Absence" "Presence" "Absence" ...


# 2. clean data
table(is.na(data))
na.omit(data)
complete.cases(data)

data[complete.cases(df), ]
data[rowSums()(is.na(data)) == 0, ]
data[, colSums(is.na(data) == 0)]

# 1. barplot
## base plot
barplot(table(data$Sex),
    ylab = "Number of sample", # add y label
    xlab = "Sex", # add x label
    main = "Age count in dataset", # add title for graph
    col = c("#90bf80", "blue"), # add color
    fill = c("pink")
)

## ggplot2 plot
ggplot(data, aes(as.factor(Sex), fill = as.factor(Sex))) +
    geom_bar() + # select a type of plot
    labs(x = "Sex", y = "Number of sample", title = "Age count in dataset") + # add title, x axis's name, y axis'name
    guides(fill = guide_legend(title = "Sex")) +
    theme(text = element_text(size = 20))

# 2. histogram
## base plot
par(mfrow = c(1, 2))
hist(data$BP,
    main = "The blood pressure level",
    xlab = "Blood pressure level"
)
hist(data$Cholesterol,
    main = "The cholesterol level",
    xlab = "Cholesterol level"
)
dev.off()
## ggplot2
### subset the data
data_sub <- data[, c("BP", "Cholesterol")]
head(data_sub)

### transpose data: wide format-> long format
mdata_sub <- melt(data_sub)
head(mdata_sub)

ggplot(mdata_sub, aes(value, fill = variable)) +
    theme_bw() +
    geom_histogram() +
    facet_grid(~variable) +
    theme(legend.position = "NULL") +
    labs(x = "") +
    theme(text = element_text(size = 25))

# 3. density plot
## base plot
### Compute the density data
dens <- density(data$BP)
par(mfrow = c(1, 2))
### plot density
plot(dens,
    frame = FALSE, col = "steelblue",
    main = "Density plot of Blood pressure"
)
### Fill the density plot using polygon()
plot(dens,
    frame = FALSE, col = "steelblue",
    main = "Density plot of blood pressure"
)
polygon(dens, col = "steelblue")
dev.off()
## ggplot2
ggplot(data, aes(BP, fill = Heart.Disease)) +
    geom_density(alpha = 0.5) +
    theme_minimal() +
    theme(text = element_text(size = 20)) +
    guides(fill = guide_legend(title = "Heart Disease"))


# 4. boxplot and violin plot
# base plot
## one variable
### Horizontal box plot
boxplot(data$Age, col = "white", xlab = "Age", horizontal = T)

# Points
stripchart(data$Age, # Data
    method = "jitter", # Random noise
    pch = 19, # Pch symbol
    col = 4, # Color of the symbol
    add = TRUE
) # Add it over

## two variable
par(mfrow = c(1, 2))
boxplot(Age ~ Heart.Disease, data = data, col = "lightblue")
vioplot(Age ~ Heart.Disease, data = data, col = "lightblue")
dev.off()


# ggplot2
ggplot(data, aes(x = Heart.Disease, y = Age, col = Heart.Disease)) +
    geom_boxplot(width = 0.3) +
    stat_compare_means(size = 7) +
    theme_classic() +
    labs(x = "Sex") +
    theme(legend.position = "NULL") +
    theme(text = element_text(size = 20)) +
    ggdist::stat_halfeye(aes(fill = Heart.Disease), adjust = 0.5, justification = -0.5, width = 0.4)


# 5. Scatter plot
## base plot
x <- data$BP
y <- data$Cholesterol
plot(x, y,
    xlab = "Blood pressure",
    ylab = "Choloesterol",
    pch = 19, frame = FALSE,
    col = "blue"
)
abline(lm(y ~ x, data = data),
    col = "black",
    lwd = 5,
    lty = 1
)

## ggplot2
ggplot(data, aes(x = BP, y = Cholesterol)) +
    geom_point(aes(col = Heart.Disease), size = 4, alpha = 0.7) +
    geom_smooth(method = "lm") +
    theme(text = element_text(size = 15)) +
    theme_classic() +
    labs(x = "Blood Pressure", col = "Heart Disease")
ggsave(paste0("output", "/save_plot.pdf"))
