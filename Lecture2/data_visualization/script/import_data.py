import pandas as pd  # Import pandas library

# Section 1: Set Working Directory
# In Python, you can change the working directory using os module
import os
os.chdir("/home/hoangnguyen/Documents/data_visualization")  # Set working directory
os.getcwd()  # Check working directory

# Section 2: Import .txt Files
data_1 = pd.read_csv("data/other_data/text.txt", sep="\t")  # Import .txt file
data_2 = pd.read_csv("data/other_data/smoking.txt", sep="\t")  # Import another .txt file
print(data_2.head())  # Display first few rows of the data

# Section 3: Import .CSV Files
data_3 = pd.read_csv("data/other_data/prawnGR.CSV")  # Import .CSV file
print(data_3.head())  # Display first few rows of the data

# Section 4: Import .tsv Files
data_4 = pd.read_csv("data/other_data/Petal.Length.tsv", sep="\t")  # Import .tsv file
print(data_4.head())  # Display first few rows of the data

# Section 5: Import .xls Files
data_4 = pd.read_excel("data/other_data/whaledata.xls", sheet_name = 0)  # Import .xls file

# Section 6: Python doesn't have an equivalent to R's fread function for fast file reading.
# But pandas provides a similar function 'read_csv' for reading .csv files.

data_5 = pd.read_csv("data/other_data/Petal.Length.tsv", sep="\t")  # Import .tsv file using read_csv()
print(data_5)  # Display the data

data_6 = pd.read_csv("data/other_data/children.txt", sep="\t")  # Import .txt file using read_csv()
print(data_6)  # Display the data

data_7 = pd.read_csv("data/other_data/Gigartina.CSV")  # Import .CSV file using read_csv()
print(data_7)  # Display the data

# Section 7: Read Multiple Files in Python Using list comprehension
list_file = [f for f in os.listdir("data/multi_files") if f.endswith('.tsv')]  # List all .tsv files in the directory

read_file = [pd.read_csv(file, sep="\t") for file in list_file]  # Read all files using list comprehension

data = pd.concat(read_file, axis=0, ignore_index=True)  # Merge all files using concat()

data_rm = data.drop_duplicates()  # Remove duplicate rows

# Section 8: Save the Data
data_rm.to_csv("output/newdata.tsv", index=False, sep="\t")  # Save the data to a .tsv file
