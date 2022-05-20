-- 1. Delete updated_by and created_by fields in the
--    dashboards tables of the development environment.
UPDATE dashboards
SET created_by_id=NULL, updated_by_id=NULL

UPDATE dashboards_cards
SET created_by_id=NULL, updated_by_id=NULL

UPDATE dashboards_tabs
SET created_by_id=NULL, updated_by_id=NULL

-- 2. Take individual backups of the following tables in the dev environment:
--      * dashboards
--      * dashboards_tabs
--      * dashboards_cards
--      * dashboards_datasets
--      * datasets_catalog

-- 3. Take a backup of the main database

-- 4. Delete all dashboards data in the following order
DELETE FROM dashboards_datasets
DELETE FROM datasets_catalog
DELETE FROM dashboards_cards
DELETE FROM dashboards_tabs

UPDATE products
SET dashboard_id=NULL

DELETE FROM dashboards
SELECT * FROM products WHERE dashboard_id IS NOT NULL

-- 5. Restore the development backups of each table in main in the following order:
--      * dashboards
--      * dashboards_tabs
--      * dashboards_cards
--      * datasets_catalog
--      * dashboards_datasets