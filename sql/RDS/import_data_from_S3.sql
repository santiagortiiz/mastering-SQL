-- 1.Install the extensions
CREATE EXTENSION aws_s3 CASCADE;
    -- Packages installed
    aws_s3.table_import_from_s3
    aws_commons

-- 2. Identify database table and S3 file

-- Create the table
CREATE TABLE t1 (col1 varchar(80), col2 varchar(80), col3 varchar(80));

-- Prepare S3 URI
SELECT aws_commons.create_s3_uri(
   'iota-datalake',
   'marian_companies.csv',
   'us-east-1'
) AS s3_uri \gset           -- \gset set the s3_uri as variable in psql

-- 3. Import data from S3 to a PostgreSQL table
-- Option 1: For psql (shell)
SELECT aws_s3.table_import_from_s3(
   'marian_companies',  -- table name
   '',                  -- columns
   '(format csv)',      -- PostgreSQL COPY command
   :'s3_uri'
);

-- Option 2
SELECT aws_s3.table_import_from_s3(
	'public.collected_companies_info',
	'',
	'(format csv, DELIMITER ''|'', header)',    -- Escaping single quotes ' by doubling them up -> ''
    aws_commons.create_s3_uri(
        'iota-datalake',
        'marian_companies.csv',
        'us-east-1'
    )
);

-- Option 3
SELECT aws_s3.table_import_from_s3(
	'public.collected_companies_info',
	'branch,latitude,longitude,state,address,open_hours',
	'(format csv, DELIMITER ''|'', header)',
	'iota-generalfiles',
	'marian_companies.csv',
	'us-east-1'
);