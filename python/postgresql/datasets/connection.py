# Standard libraries
import os

# SQLAlchemy
import sqlalchemy as sa

def get_db_connection(**kwargs):
    user = os.environ.get('user', 'postgres')
    password = os.environ.get('password', 'r00t')
    host = os.environ.get('host', 'localhost')
    port = os.environ.get('port', 5432)

    default_db = os.environ.get('POSTGRES_DB_NAME', None)
    database = kwargs.get('database', default_db)

    conn_str = f"postgresql+psycopg2://{user}:{password}@{host}:{port}/{database}"
    engine = sa.create_engine(conn_str)
    cnx = engine.connect()
    return cnx