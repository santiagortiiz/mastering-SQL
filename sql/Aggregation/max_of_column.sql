SELECT 
	MAX(subset.current_employee_estimate)
FROM
(
	SELECT 
	current_employee_estimate::double precision
	FROM food_and_beverage
) AS subset
;