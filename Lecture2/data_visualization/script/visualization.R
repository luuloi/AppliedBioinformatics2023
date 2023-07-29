# This script introduces visualization in base plot and ggplot2 in R

# Section 1: Load required libraries
# Loading necessary libraries for data manipulation and visualization
library(ggplot2)
library(reshape2)
library(vioplot)
library(ggpubr)
library(ggdist)

# Section 2: Set working directory
# Setting the working directory
setwd("/home/ds02/Documents/data_visualization")
getwd()  # Checking the working directory

# Section 3: Import Data
# Importing data from a CSV file
data <- read.csv("data/Heart_Disease_Prediction.csv")
dim(data)  # Checking the dimensions of the data
head(data)  # Displaying the first few rows of the data

# Section 4: Data structure explanation
# Understanding the structure of the data
str(data)

# Section 5: Data cleaning
# Cleaning the data by handling missing values
table(is.na(data))  # Checking the presence of NA values
na.omit(data)  # Removing rows with NA values
complete.cases(data)  # Checking for complete cases (no NA values)

# Section 6: Visualization
## Barplot
### Base plot barplot
barplot(table(data$Sex),
    ylab = "Number of sample",  # Adding y label
    xlab = "Sex",  # Adding x label
    main = "Age count in dataset",  # Adding title for graph
    col = c("#90bf80", "blue"),  # Adding color
    fill = c("pink")  # Adding fill color
)

### ggplot2 barplot
ggplot(data, aes(as.factor(Sex), fill = as.factor(Sex))) +
    geom_bar() +  # Selecting bar plot type
    labs(x = "Sex", y = "Number of sample", title = "Age count in dataset") +  # Adding labels and title
    guides(fill = guide_legend(title = "Sex")) +  # Adding legend
    theme(text = element_text(size = 20))  # Setting theme

## Histogram
### Base plot histograms
par(mfrow = c(1, 2))  # Setting up a plotting area for two plots
hist(data$BP,
    main = "The blood pressure level",  # Adding main title
    xlab = "Blood pressure level"  # Adding x label
)
hist(data$Cholesterol,
    main = "The cholesterol level",  # Adding main title
    xlab = "Cholesterol level"  # Adding x label
)
dev.off()  # Closing the plotting device

### ggplot2 histograms
data_sub <- data[, c("BP", "Cholesterol")]  # Subsetting the data
mdata_sub <- melt(data_sub)  # Reshaping data from wide to long format
ggplot(mdata_sub, aes(value, fill = variable)) +
    theme_bw() +
    geom_histogram() +  # Adding histogram
    facet_grid(~variable) +  # Adding facets
    theme(legend.position = "NULL") +
    labs(x = "") +
    theme(text = element_text(size = 25))  # Setting theme

## Density plot
### Base plot density
dens <- density(data$BP)  # Calculating density of 'BP'
par(mfrow = c(1, 2))  # Setting up a plotting area for two plots
plot(dens,
    frame = FALSE, col = "steelblue",  # Adding color and removing frame
    main = "Density plot of Blood pressure"  # Adding main title
)
plot(dens,
    frame = FALSE, col = "steelblue",  # Adding color and removing frame
    main = "Density plot of blood pressure"  # Adding main title
)
polygon(dens, col = "steelblue")  # Filling the density plot
dev.off()  # Closing the plotting device

### ggplot2 density plot
ggplot(data, aes(BP, fill = Heart.Disease)) +
    geom_density(alpha = 0.5) +  # Adding density plot with transparency
    theme_minimal() +  # Setting minimal theme
    theme(text = element_text(size = 20)) +
    guides(fill = guide_legend(title = "Heart Disease"))  # Adding legend

## Boxplot and violin plot
### Base plot boxplot and violin plot
boxplot(data$Age, col = "white", xlab = "Age", horizontal = T)  # Adding horizontal boxplot
stripchart(data$Age,  # Adding points to boxplot
    method = "jitter",  # Adding random noise
    pch = 19,  # Setting point symbol
    col = 4,  # Setting color of the symbol
    add = TRUE  # Adding it over the boxplot
)

par(mfrow = c(1, 2))  # Setting up a plotting area for two plots
boxplot(Age ~ `Heart Disease`, data = data, col = "lightblue")  # Adding boxplot
vioplot(Age ~ `Heart Disease`, data = data, col = "lightblue")  # Adding violin plot
dev.off()  # Closing the plotting device

### ggplot2 boxplot and violin plot
ggplot(data, aes(x = Heart.Disease, y = Age, col = Heart.Disease)) +
    geom_boxplot(width = 0.3) +  # Adding boxplot
    stat_compare_means(size = 7) +  # Adding comparison of means
    theme_classic() +  # Setting classic theme
    labs(x = "Sex") +
    theme(legend.position = "NULL") +
    theme(text = element_text(size = 20)) +
    ggdist::stat_halfeye(aes(fill = Heart.Disease), adjust = 0.5, justification = -0.5, width = 0.4)  # Adding half-eye plot

## Scatter plot
### Base plot scatter plot
x <- data$BP  # Setting x variable
y <- data$Cholesterol  # Setting y variable
plot(x, y,
    xlab = "Blood pressure",  # Adding x label
    ylab = "Cholesterol",  # Adding y label
    pch = 19, frame = FALSE,  # Setting point symbol and removing frame
    col = "blue"  # Setting color
)
abline(lm(y ~ x, data = data),  # Adding regression line
    col = "black",  # Setting color of line
    lwd = 5,  # Setting line width
    lty = 1  # Setting line type
)

### ggplot2 scatter plot
ggplot(data, aes(x = BP, y = Cholesterol)) +
    geom_point(aes(col = `Heart Disease`), size = 4, alpha = 0.7) +  # Adding points
    geom_smooth(method = "lm") +  # Adding regression line
    theme(text = element_text(size = 15)) +
    theme_classic() +  # Setting classic
