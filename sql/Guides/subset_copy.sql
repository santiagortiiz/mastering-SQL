-- CREATE EXTENSION dblink;
-- DROP TABLE IF EXISTS consumer_expenditures
CREATE TABLE consumer_expenditures
AS (
	SELECT *
	FROM dblink(
		'port=5432
		host=host
		user=user
		password=password
		dbname=consumer_expenditures',
		'SELECT
			id,
			state,
			zip_code,
			total_population,
			sex,
			percent_population_for_sex,
			age,
			percent_population_for_age
		FROM consumer_expenditures_2gb LIMIT 100000'
	) AS (
		id integer,
		state character varying,
		zip_code text,
		total_population numeric(8),
		sex character varying,
		percent_population_for_sex real,
		age character varying,
		percent_population_for_age real
	)
)