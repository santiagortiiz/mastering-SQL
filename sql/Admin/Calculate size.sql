CREATE OR REPLACE FUNCTION calculate_size()
RETURNS VOID
LANGUAGE plpgsql
AS $$
DECLARE
	iota CHARACTER VARYING;
	iotaimpact CHARACTER VARYING;
	datassets CHARACTER VARYING;
	consumer_expenditures CHARACTER VARYING;
	nutrition_survey CHARACTER VARYING;
BEGIN
	iota := SELECT * 
			FROM dblink(
				'port=5432
				host=something
				user=something
				password=something
				dbname=something,
				'SELECT pg_size_pretty(pg_database_size(''iota''))'
			)
			AS iota (size text)
	iotaimpact := SELECT * 
				FROM dblink(
					'port=5432
					host=something
					user=something
					password=something
					dbname=something,
					'SELECT pg_size_pretty(pg_database_size(''iotaimpact''))'
				)
				AS iotaimpact (size text)
	datassets := SELECT * 
				FROM dblink(
					'port=5432
					host=something
					user=something
					password=something
					dbname=something,
					'SELECT pg_size_pretty(pg_database_size(''datassets''))'
				)
				AS datassets (size text)
	consumer_expenditures := SELECT *
				FROM dblink(
					'port=5432
					host=something
					user=something
					password=something
					dbname=something,
					'SELECT pg_size_pretty(pg_database_size(''consumer_expenditures''))'
				)
				AS consumer_expenditures (size text)
	nutrition_survey := SELECT *
				FROM dblink(
					'port=5432
					host=something
					user=something
					password=something
					dbname=something,
					'SELECT pg_size_pretty(pg_database_size(''nutrition_survey''))'
				)
				AS nutrition_survey (size text)

	INSERT INTO size (
        iota, iotaimpact,
        datassets, consumer_expenditures, nutrition_survey
    )
	VALUES (
        iota, iotaimpact,,
        datassets, consumer_expenditures, nutrition_survey);
END
$$;

SELECT calculate_size();