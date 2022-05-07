-- orders of a user
SELECT *
FROM orders
WHERE user_id IN (
	SELECT id
	FROM users
	WHERE username ILIKE '%<username_keyword>%'
)
ORDER BY created DESC

-- items of the orders of a user
SELECT *
FROM order_items
WHERE order_id IN (
	SELECT id
	FROM orders
	WHERE user_id IN (
		SELECT id
		FROM users
		WHERE username ILIKE '%username%'
    )
)