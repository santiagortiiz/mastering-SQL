''' Automatic Upload of Datasets to Postgre
    Target: Data Engineers

    Libraries:
        Numpy: 1.19.2
        Pandas: 1.3.3
        sqlalchemy: 1.3.20
        psycopg2: 2.9.1 (dt dec pq3 ext lo64)

    - EXAMPLE OF USE:

    # Arguments Setup
    file_name = 'food-and-beverage.txt'
    path = f"D:/Laboral/Iota Impact/Projects/Datasets/{file_name}"
    kwargs = {
        "user": "postgres", # Default: postgres
        "password": "r00t",
        "host": "localhost",
        "database": "datasets",
        # "encoding": "utf-16", # default: utf-8
        "chunksize": 5000, # Be carefull with memory overflow
        # "exclude_columns": ['Unnamed: 0', 'Unnamed: 0.1'],
        "sep": '\t', # file delimiter
        "table_name": "food_and_beverage",
        "partition": True # Change to True if you want to partition the database table
    }

    # Execute of the function
    upload_dataset(path, **kwargs)
'''
# Standard libraries
# import timeit
import numpy as np
import pandas as pd

# Databases libraries
import sqlalchemy as sa
import psycopg2 as pg

# Utilities
from connection import get_db_connection
from utils.dataframes import get_columns, clean_df
from utils.data_structures import remove_items, clean_string
from utils.sql import createTable_columns_string


def upload_dataset(path, **kwargs):
    ''' Required arguments:
        * Read CSV args
        path, chunksize, sep

        * df.to_sql
        user, password, host, port, database, table_name, 
    '''
    
    if path.endswith('.csv') or path.endswith('.txt'):
        
        # Read the Dataset in Chunks
        sep = kwargs.get('sep', None)
        if 'sep' is None:
            raise Exception('Please specify separator (sep) field')
        
        # Read the columns of the dataset
        columns = get_columns(path, sep)
            
        # Exclude specified columns
        exclude_columns = kwargs.get('exclude_columns', None)
        if exclude_columns is not None:
            remove_items(columns, exclude_columns)

        #TODO Use specified fields
        if 'use_columns' in kwargs:
            
            if isinstance(kwargs.get('use_columns'), list):
                columns = kwargs.get('use_columns')
            else:
                return 'field "use_columns" must be a list of strings'
    
        # Read CSV file as chunks
        encoding = kwargs.get('encoding', 'utf-8')
        chunksize = kwargs.get('chunksize', 10000)
        encoding_errors = kwargs.get('encoding_errors', 'ignore')
        chunk_dataset = pd.read_csv(    
            path,
            sep=sep,
            # index_col=0,
            header=0,
            usecols=columns,
            # engine='c',
            # dtype=str,
            iterator=True,
            chunksize=chunksize,
            encoding=encoding,
            encoding_errors=encoding_errors
        )
    
    # Setup database connection
    if not 'table_name' in kwargs:
        raise Exception('Please specify table_name field')
    
    cnx = get_db_connection(**kwargs)
    table_name = kwargs.get('table_name')
    table_name = clean_string(table_name)

    # Build de raw SQL statement required for create the table
    data_types_schema = kwargs.get('data_types_schema', None)
    if data_types_schema is not None:
        # Columns of the defined data types schema
        remove_items(data_types_schema, exclude_columns)
        columns_string = createTable_columns_string(data_types_schema)
        
    else:
        # Columns of character varying data type
        columns_string = [clean_string(column_name) for column_name in columns]
        columns_string = ', '.join([i + ' CHARACTER VARYING' for i in columns])    
    
    # Create partition if specified
    partition = kwargs.get('partition', False)
    partition_string = ''
    
    if partition:
        partition_string = 'PARTITION BY RANGE (id)'

    raw_query = f'''
    CREATE TABLE IF NOT EXISTS public.{table_name}
    (
        id SERIAL,
        {columns_string}
    ) {partition_string};
    '''
    cnx.execute(raw_query)

    # Partition index initialization
    low_index = 1
    high_index = chunksize + 1
    
    demo = kwargs.get('demo', 0)
    for df in chunk_dataset:
        try:
            print(f'\nInserting records from: {low_index} to {high_index}...')
            
            # Replace columns names
            df.columns = clean_string(columns)
            
            if partition:
                # Create Partition SQL statement
                partition = f'''
                    CREATE TABLE IF NOT EXISTS public.{table_name}_{low_index}_{high_index-1} 
                    PARTITION OF public.{table_name}
                    FOR VALUES FROM ({low_index}) TO ({high_index})
                    TABLESPACE pg_default;
                '''
                cnx.execute(partition)
            
            # Clean dataframe before upload
            clean_df(df)

            # Insert dataframe records into the specified table
            df.to_sql(
                name = table_name,
                con = cnx,
                if_exists = 'append', # default 'fail'
                index = False,
                method='multi'
            )
                
            #  Index update
            print(f'Records from: {low_index} to {high_index} inserted')
            low_index += chunksize
            high_index += chunksize

            # Stop at the 3 time if its a demo
            if demo > 0:
                demo += 1
            
                if demo > 3:
                    break
                
        except Exception as e:
            print('ERROR: ', e)
    