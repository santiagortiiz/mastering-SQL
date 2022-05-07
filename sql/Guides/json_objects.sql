-- Create table
CREATE TABLE IF NOT EXISTS json_table (
	id serial NOT NULL PRIMARY KEY,
	json_object json NOT NULL
);

-- Insert records
INSERT INTO json_table (json_object)
VALUES 	('{
	"key_1": "value_1", 
	"key_2": {
		"key_3": "value_3"
	}
}'), ('{
	"key_4": "value_4", 
	"key_5": {
		"key_6": "value_5"
	}
}');

-- Check content
SELECT * FROM json_table;

-- Retrieve Information 	
SELECT
-- 	field ->> 'key' AS result -- type(result) = str
	json_object ->> 'key_1' AS key_1,
-- 	field -> 'key' AS result -- type(result) = json
	json_object -> 'key_2' AS key_2
FROM json_table;

-- Conditioning
SELECT 
	json_object
FROM json_table
WHERE json_object ->> 'key_4'='value_4';

-- Casting
SELECT 
	(json_object -> 'key_1')::VARCHAR(10) AS key_1
FROM json_table;


