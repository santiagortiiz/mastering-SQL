CREATE EXTENSION dblink;

-- Example 1: Roles
SELECT *
FROM dblink(
	'port=5432
	host=host
	user=user
	password=password
	dbname=dbname',
	'SELECT * FROM roles'
)
-- Format in which the information will be retrieved
AS iota (id integer, created date, modified date, active boolean, role text)

-- Example 2: Products
SELECT *
FROM dblink(
	'port=5432
	host=host
	user=user
	password=password
	dbname=dbname',
	'SELECT * FROM products LIMIT 1'
)
AS (
	id integer,
	created date,
	modified date,
	active boolean,
	title text,
	url text,
	dummy_url text,
	s3_prefix text,
	s3_entity_tag text,
	details_id integer
)

INSERT INTO products (
	created, modified, active,
	title, url, dummy_url, s3_prefix, s3_entity_tag,
	stripe_product_id, subscribable
)
SELECT *
FROM dblink(
	'port=5432
	host=host
	user=user
	password=password
	dbname=dbname',
	'SELECT
		created, modified, active,
		title, url, dummy_url,
		s3_prefix, s3_entity_tag,
		stripe_id, subscribable
	FROM products'
)
AS (
	created date, modified date, active boolean,
	title text, url text, dummy_url text,
	s3_prefix text, s3_entity_tag text,
	stripe_id character varying,
	subscribable boolean
)

-- Example 3: Company Branches
INSERT INTO company_branches (
	created, modified, active,
	latitude, longitude,
	address, city_id, company_id, branch_name
)
SELECT *
FROM dblink(
	'port=5432
	host=host
	user=user
	password=password
	dbname=geography',
	'SELECT
		created, modified, active,
		latitude, longitude,
		address, city_id, company_id, branch_name
	FROM company_branches
	WHERE company_id BETWEEN 1 AND 25
	ORDER BY id ASC'
)
AS (
	created date,
	modified date,
	active boolean,
	latitude double precision,
	longitude double precision,
	address character varying,
	city_id bigint,
	company_id bigint,
	branch_name character varying
)