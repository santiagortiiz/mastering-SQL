SELECT *
FROM pg_tables;

select * from pg_tables where tableowner = 'username';
select * from pg_tables where tablename = 'table_name';