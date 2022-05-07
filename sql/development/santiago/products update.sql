UPDATE products
SET type='research_report'
WHERE s3_prefix ILIKE '%report%';

UPDATE products
SET type='dashboard'
WHERE s3_prefix ILIKE '%dash%';

UPDATE products
SET type='benchmark'
WHERE s3_prefix='';

SELECT *
FROM products
WHERE s3_prefix = '';

SELECT *
FROM products
WHERE s3_prefix = '' AND title ILIKE '%testing%';