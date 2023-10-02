import pandas as pd
import os

# Define the input Excel file path
input_excel_file = "input_data.xlsx"

# Create a directory to store the output .txt files
output_directory = "output_txt_files"
os.makedirs(output_directory, exist_ok=True)

# Open the Excel file
with pd.ExcelFile(input_excel_file, engine="openpyxl") as xls:
    # Iterate through each sheet in the Excel file
    for sheet_name in xls.sheet_names:
        # Read the sheet into a pandas DataFrame
        df = pd.read_excel(xls, sheet_name)
        
        # Define the output .txt file path for the current sheet
        output_txt_file = os.path.join(output_directory, f"{sheet_name}.txt")
        
        # Write the DataFrame to a .txt file with comma delimiters
        df.to_csv(output_txt_file, sep=",", index=False)

print(f"Text files have been created in the '{output_directory}' directory for each sheet.")
