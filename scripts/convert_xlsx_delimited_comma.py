import pandas as pd

# Define the input Excel file path
input_excel_file = "input_data.xlsx"

# Define the output .txt file path
output_txt_file = "output_data.txt"

# Read the Excel file into a pandas DataFrame
df = pd.read_excel(input_excel_file, engine="openpyxl")

# Write the DataFrame to a .txt file with comma delimiters
df.to_csv(output_txt_file, sep=",", index=False)

print(f"File '{output_txt_file}' has been created with comma delimiters.")
