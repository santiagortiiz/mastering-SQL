-- Get the size of a database
SELECT pg_database_size('db_name')
SELECT pg_size_pretty(pg_database_size('db_name'))