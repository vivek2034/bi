import pandas as pd 
file_path = 'data.csv' 
data = pd.read_csv(file_path) 
print("First 5 rows of the dataset:") 
print(data.head()) 
print("\nDataset Information:") 
print(data.info()) 
print("\nSummary Statistical:") 
print(data.describe()) 
if 'Category' in data.columns: 
    print("\nUnique values in 'Category' column:") 
    print(data['Category'].value_counts()) 
