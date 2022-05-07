-- Deleting
DELETE FROM datasets_catalog
DELETE FROM dashboards_datasets
DELETE FROM dashboards_cards
DELETE FROM dashboards_tabs

UPDATE products
SET dashboard_id=NULL

DELETE FROM dashboards
SELECT * FROM products WHERE dashboard_id IS NOT NULL

-- Restoring