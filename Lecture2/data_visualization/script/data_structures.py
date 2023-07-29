# This script is for discovering, generating, and editing data structures in Python

# Section 1: Scalar
sc = 1  # Define a scalar
print(sc)  # Print the scalar

# Section 2: List (Python's equivalent of R's vector)
a = list(range(1, 11))  # Create a numeric list
print(a)  # Display the list
print(len(a))  # Display the length of the list
print(type(a))  # Display the type of the list

b = ["A", "B", "C", "D"]  # Create a character list
print(b)  # Display the list
print(len(b))  # Display the length of the list
print(type(b))  # Display the type of the list

e = a + b  # Combine the numeric list 'a' and character list 'b' into a new list 'e'
print(e)  # Display the combined list

# Section 3: 2-Dimensional List (Python's equivalent of R's matrix) & 3-Dimensional List (Python's equivalent of R's array)
import numpy as np

my_mat = np.array(range(1, 17)).reshape(4, 4)  # Create a 4x4 matrix
print(my_mat[0,:])  # Access and display the first row of the matrix

my_array = np.array(range(1, 17)).reshape(2, 4, 2)  # Create a 3-dimensional array
print(my_array)  # Display the array

# Section 4: Dictionary (Python's equivalent of R's list)
list_1 = {
    "colours": ["black", "yellow", "orange"],
    "evaluation": [True, True, False, True, False, False],
    "time": np.array(range(1, 7)).reshape(3, 2)
}  # Create a dictionary
print(list_1)  # Display the dictionary

# Section 5: DataFrame (Python's equivalent of R's dataframe)
import pandas as pd

p_height = [180, 155, 160, 167, 181]  # Create a list for height
p_weight = [65, 50, 52, 58, 70]  # Create a list for weight
p_names = ["Joanna", "Charlotte", "Helen", "Karen", "Amy"]  # Create a list for names

dataf = pd.DataFrame({"height": p_height, "weight": p_weight, "names": p_names})  # Create a dataframe using the lists
print(dataf)  # Display the dataframe

print(dataf.shape)  # Show the dimensions of the dataframe
print(dataf.info())  # Show the structure of the dataframe
print(dataf.columns)  # Show the column names of the dataframe
print(dataf.iloc[0,:])  # Show the first row of the dataframe

# Section 6: Handle Missing Values
Name = ["Tuan", "Nhan", "Ngoc", "Tien", "Kien"]  # Create a list for names
Height = [1.63, 1.78, 1.60, 1.56, None]  # Create a list for height with a missing value
Weight = [60, 72, 58, None, None]  # Create a list for weight with missing values

df = pd.DataFrame({"Name": Name, "Height": Height, "Weight": Weight})  # Create a dataframe with missing values
print(df)  # Display the dataframe

print(df.dropna())  # Remove rows with any missing values
print(df.dropna().shape[0] == df.shape[0])  # Check if all cases are complete
print(df[~df.isna().any(axis=1)])  # Display only complete cases
print(df.isna().sum())  # Count the number of missing values
print(df[~df.isna().any(axis=1)])  # Display rows with no missing values
print(df.isna().sum(axis=1) == 0)  # Get a boolean series indicating rows with no missing values
