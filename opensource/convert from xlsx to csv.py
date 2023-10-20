import pandas as pd
import os

# Define the input Excel file path
input_excel_file = "Final Data Set.xlsx"

# Create a directory to store the output .txt files
output_directory = "row data"
os.makedirs(output_directory, exist_ok=True)

# Open the Excel file
with pd.ExcelFile(input_excel_file, engine="openpyxl") as xls:
    # Iterate through each sheet in the Excel file
    for sheet_name in xls.sheet_names:
        # Read the sheet into a pandas DataFrame
        df = pd.read_excel(xls, sheet_name)
        
        # Define the output .txt file path for the current sheet
        row_data = os.path.join(output_directory, f"{sheet_name}.csv")
        
        # Write the DataFrame to a .txt file with comma delimiters
        df.to_csv(row_data, sep=",", index=False)
print(f"csv files have been created in the '{output_directory}' directory for each sheet.")
