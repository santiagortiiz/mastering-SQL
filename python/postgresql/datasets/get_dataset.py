from sqlalchemy import create_engine
import psycopg2 as pg
import timeit

def psycopg_query(cnx, query):
    cursor = cnx.cursor()
    cursor.execute(query)
    dataset = cursor.fetchall()
    cursor.close()
    return dataset

def sqlalchemy_query(cnx, query):
    dataset = cnx.execute(query).fetchall()
    return dataset

def get_dataset(**kwargs):
    # Database configuration
    engine = kwargs.get('engine', None)
    user = kwargs.get('user', 'user')
    password = kwargs.get('password', 'password')
    host = kwargs.get('host', 'host')
    port = kwargs.get('port', 5432)
    database = kwargs.get('database', 'database')

    # Connection Setup
    if engine == 'postgre':
        cnx = pg.connect(database=database, user=user, password=password , host=host, port=port)

    elif engine == 'sqlalchemy':
        conn_str = f"postgresql+psycopg2://{user}:{password}@{host}:{port}/{database}"
        eng = create_engine(conn_str)
        cnx = eng.connect()
    
    else:
        return 'please select database ORM or driver'

    # Query building
    table = kwargs.get('table', 'dataset_food_and_beverage')
    skip = str(kwargs.get('skip', '0'))
    limit = str(kwargs.get('limit', '200000'))
    
    query = f'SELECT * FROM {table} OFFSET {skip} LIMIT {limit};'

    # Time measurement (Start)
    start = timeit.default_timer()

    # Query Execution
    if engine == 'postgre':
        dataset = psycopg_query(cnx, query)

    elif engine == 'sqlalchemy':
        dataset = sqlalchemy_query(cnx, query)
        
    # Time measurement (End)
    stop = timeit.default_timer()
    execution_time = stop - start


    # return dataset
    # return execution_time
    return (len(dataset), execution_time)

'''
from scripts.get_dataset import get_dataset
print(
    get_dataset(
        engine='sqlalchemy',
        host='localhost',
        database='testdb',
        # limit=10
    )
)
'''

