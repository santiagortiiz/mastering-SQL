-- Create Procedure Statement
CREATE OR REPLACE PROCEDURE procedure_name()
LANGUAGE SQL

-- 	Body
AS $$
    DROP TABLE IF EXISTS new_table;
	CREATE TABLE new_table (column_a char(5) CONSTRAINT firstkey PRIMARY KEY);
$$;

-- Call procedure
CALL procedure_name();
