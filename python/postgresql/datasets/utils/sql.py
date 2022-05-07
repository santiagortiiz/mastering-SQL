# Utilities
from utils.data_structures import clean_string

#TODO Add a default data type for not included columns in the schema
def createTable_columns_string(schema):
    '''Convert the schema of the columns-datatypes into a RAW INSERT SQL format'''

    new_schema = {}
    
    if not isinstance(schema, dict):
        raise Exception('The schema must be a dictionary with "key:value" like "column:data_type"')
        
    for key in schema:
        column_name = clean_string(key)
        data_type = schema[key]
        new_schema[key] = f"{column_name} {data_type}"
    
    column_datatype = new_schema.values()
    column_datatype = list(column_datatype)
    column_datatype = ', '.join(column_datatype)
    return column_datatype