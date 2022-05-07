-- Execute a function # Between $$ it could be an optional string
DO $BODY$
DECLARE
    -- var var_type := default_value;
    product record;
BEGIN
    FOR product IN SELECT * FROM products LIMIT 1 LOOP
        RAISE NOTICE 'Product name: %', product.title;
    END LOOP;
END
$BODY$

-- Store a function
CREATE FUNCTION PL_name()
    RETURNS void
AS $$
DECLARE
    -- var var_type := default_value;
    product record;
BEGIN
    FOR product IN SELECT * FROM products LIMIT 1 LOOP
        RAISE NOTICE 'Product name: %', product.title;
    END LOOP;
END
$$
LANGUAGE PLPGSQL;

-- Call the function
SELECT PL_name()


-- Return values in a function
CREATE OR REPLACE FUNCTION PL_name()
    RETURNS integer
AS $$
DECLARE
    -- var var_type := default_value;
    product record;
    counter integer := 0;
BEGIN
    FOR product IN SELECT * FROM products LIMIT 1 LOOP
        RAISE NOTICE 'Product name: %', product.title;
        counter := counter + 1;
    END LOOP;
END
$$
LANGUAGE PLPGSQL;


-- Remove function
DROP FUNCTION PL_name();