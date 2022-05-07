# Standard libraries
import pandas as pd

def get_columns(file_path, sep):
    ''' Get the column names of a csv file'''

    columns = list(pd.read_csv(file_path, nrows=1))

    if len(columns) == 1:
        columns = columns[0].split(sep)
        
    return columns


def clean_df(df):
    missing_condition = df.isin(['missing']).any(axis=1)
    indexes = df[missing_condition].index
    df.drop(indexes, inplace=True)