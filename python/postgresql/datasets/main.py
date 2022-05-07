''' Execution statement: py python/postgresql/datasets/main.py'''

# Standard libraries
import os
from dotenv import load_dotenv

# Data types Schema
from datatypes_schemas.food_and_beverage import food_and_beverage

# Modules
from upload import upload_dataset

if __name__ == '__main__':
    # Load environment variables
    load_dotenv()
    breakpoint()
    # Arguments Setup
    file_name = 'food-and-beverage.txt'
    path = f"D:/Laboral/Iota Impact/Projects/Datasets/{file_name}"
    kwargs = {
        "database": "datasets",
        # "encoding": "utf-16", # default: utf-8
        "chunksize": 5000, # Be carefull with memory overflow
        # "exclude_columns": ['Unnamed: 0', 'Unnamed: 0.1'],
        "sep": '\t', # file delimiter
        "table_name": "food_and_beverage",
        "partition": True, # Change to True if you want to partition the database table
        "demo": 0, # Default to 0
        "data_types_schema": food_and_beverage
    }
    
    # Execute of the function
    upload_dataset(path, **kwargs)