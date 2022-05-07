-- Common table expressions for ETL
WITH
virtual_table_A AS (
	-- Estimated employees by companie
	SELECT id, name, total_employee_estimate
	FROM food_and_beverage_limit_100
	WHERE total_employee_estimate > 40000
),
virtual_table_B AS (
	-- Industries of Companies in TX and OH
	SELECT id, state, name, locality, industry
	FROM food_and_beverage_limit_100
	WHERE state in ('TX', 'OH')
)

-- Using virtual tables (cleaner and eassier)
SELECT
	vta.id, vta.name, vta.total_employee_estimate,
	vtb.state, vtb.locality, vtb.industry
FROM virtual_table_A AS vta
JOIN virtual_table_B AS vtb
	ON vta.id = vtb.id;