UPDATE products p
SET    overview = pd.description
FROM   product_details pd
WHERE  pd.id = p.details_id