COPY companies_dataset
FROM 'D:\companiesv2.csv'
DELIMITER '|'
CSV HEADER;

SELECT * FROM companies_dataset