-- https://www.postgresql.org/docs/13/sql-copy.html

COPY table_name [ ( column_name [, ...] ) ]
    FROM { 'filename' | PROGRAM 'command' | STDIN }
    [ [ WITH ] ( option [, ...] ) ]
    [ WHERE condition ]

COPY companies_dataset
FROM 'D:\companies without commas and parenthesis.csv'
WITH (FORMAT csv, header true, delimiter ',');

COPY companies_dataset
FROM 'D:\companies without commas and parenthesis.csv'
DELIMITER '|'
CSV HEADER;