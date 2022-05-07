-- Create Function Statement
CREATE OR REPLACE FUNCTION count_something()
RETURNS int
LANGUAGE plpgsql

-- 	Body
AS $$
BEGIN
	RETURN COUNT(*) FROM table_name;
END
$$;