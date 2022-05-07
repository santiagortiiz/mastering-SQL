-- Overview
SELECT *
FROM consumer_expenditures_2gb
LIMIT 100;

-- ALTER COLUMNS
ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_population 
SET DATA TYPE numeric(8,0)
USING total_population::numeric(8,0);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN percent_population_for_sex 
SET DATA TYPE real
USING percent_population_for_sex::real;

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN percent_population_for_race_etnicity 
SET DATA TYPE real
USING percent_population_for_race_etnicity::real;

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN percent_population_for_age 
SET DATA TYPE real
USING percent_population_for_age::real;

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN percent_population_who_belongs_to_a_household_with_income 
SET DATA TYPE real
USING percent_population_who_belongs_to_a_household_with_income::real;

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN percent_category_percentage 
SET DATA TYPE double precision
USING percent_category_percentage::double precision;

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category 
SET DATA TYPE numeric(10,6)
USING total_category::numeric(10,6);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_food_expenditure 
SET DATA TYPE numeric(10, 6)
USING total_category::numeric(10, 6);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN food_at_home 
SET DATA TYPE numeric(10, 6)
USING food_at_home::numeric(10, 6);

-- -- -- -- -- -- Massive alter
ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN cereal_and_cereal_products 
SET DATA TYPE numeric(6, 4)
USING cereal_and_cereal_products::numeric(7, 5);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN bakery_products 
SET DATA TYPE numeric(8, 5)
USING bakery_products::numeric(8, 5);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN expenditures_on_beef 
SET DATA TYPE numeric(7, 4)
USING expenditures_on_beef::numeric(7, 4);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN pork 
SET DATA TYPE numeric(8, 5)
USING pork::numeric(8, 5);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN other_meats
SET DATA TYPE numeric(6, 4)
USING other_meats::numeric(6, 4);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN poultry
SET DATA TYPE numeric(7, 5)
USING poultry::numeric(7, 5);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN fish_and_seafood
SET DATA TYPE numeric(7, 4)
USING fish_and_seafood::numeric(7, 4);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN eggs
SET DATA TYPE numeric(5, 3)
USING eggs::numeric(5, 3);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN fresh_milk_and_cream
SET DATA TYPE numeric(5, 3)
USING fresh_milk_and_cream::numeric(5, 3);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN other_dairy_products
SET DATA TYPE numeric(6, 4)
USING other_dairy_products::numeric(6, 4);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN fresh_fruits
SET DATA TYPE numeric(7, 4)
USING fresh_fruits::numeric(7, 4);

-- -- -- -- -- -- -- -- 
ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN fresh_vegetables
SET DATA TYPE numeric(9, 6)
USING fresh_vegetables::numeric(9, 6);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN processed_fruits
SET DATA TYPE numeric(7, 4)
USING processed_fruits::numeric(7, 4);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN processed_vegetables
SET DATA TYPE numeric(7, 5)
USING processed_vegetables::numeric(7, 5);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN sugar_and_other_sweets
SET DATA TYPE numeric(6, 4)
USING sugar_and_other_sweets::numeric(6, 4);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN nonalcoholic_beverages
SET DATA TYPE numeric(8, 5)
USING nonalcoholic_beverages::numeric(8, 5);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN fats_and_oils
SET DATA TYPE numeric(7, 5)
USING fats_and_oils::numeric(7, 5);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN miscellaneous_foods
SET DATA TYPE numeric(8, 5)
USING miscellaneous_foods::numeric(8, 5);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN food_away_from_home
SET DATA TYPE numeric(10, 6)
USING food_away_from_home::numeric(10, 6);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN alcoholic_beverages
SET DATA TYPE numeric(7, 4)
USING alcoholic_beverages::numeric(7, 4);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_total_food_expenditure
SET DATA TYPE float8
USING total_category_total_food_expenditure::float8;

-- TOTAL CATEGORY
ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_food_at_home
SET DATA TYPE numeric(9, 2)
USING total_category_food_at_home::numeric(9, 2);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_cereal_and_cereal_products
SET DATA TYPE numeric(8, 2)
USING total_category_cereal_and_cereal_products::numeric(8, 2);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_bakery_products
SET DATA TYPE numeric(8, 2)
USING total_category_bakery_products::numeric(8, 2);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_expenditures_on_beef
SET DATA TYPE numeric(9, 2)
USING total_category_expenditures_on_beef::numeric(9, 2);
-- here
ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_pork
SET DATA TYPE numeric(8, 2)
USING total_category_pork::numeric(8, 2);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_other_meats
SET DATA TYPE numeric(8, 2)
USING total_category_other_meats::numeric(8, 2);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_poultry
SET DATA TYPE numeric(8, 2)
USING total_category_poultry::numeric(8, 2);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_fish_and_seafood
SET DATA TYPE numeric(8, 2)
USING total_category_fish_and_seafood::numeric(8, 2);
-- here

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_eggs
SET DATA TYPE numeric(8, 2)
USING total_category_eggs::numeric(8, 2);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_fresh_milk_and_cream
SET DATA TYPE numeric(8, 2)
USING total_category_fresh_milk_and_cream::numeric(8, 2);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_other_dairy_products
SET DATA TYPE numeric(8, 2)
USING total_category_other_dairy_products::numeric(8, 2);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_fresh_fruits
SET DATA TYPE numeric(8, 2)
USING total_category_fresh_fruits::numeric(8, 2);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_fresh_vegetables
SET DATA TYPE numeric(8, 2)
USING total_category_fresh_vegetables::numeric(8, 2);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_processed_fruits
SET DATA TYPE numeric(8, 2)
USING total_category_processed_fruits::numeric(8, 2);
-- HERE
ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_processed_vegetables
SET DATA TYPE numeric(8, 2)
USING total_category_processed_vegetables::numeric(8, 2);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_sugar_and_other_sweets
SET DATA TYPE numeric(8, 2)
USING total_category_sugar_and_other_sweets::numeric(8, 2);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_nonalcoholic_beverages
SET DATA TYPE numeric(8, 2)
USING total_category_nonalcoholic_beverages::numeric(8, 2);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_fats_and_oils
SET DATA TYPE numeric(8, 2)
USING total_category_fats_and_oils::numeric(8, 2);
-- HERE 
ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_miscellaneous_foods
SET DATA TYPE numeric(9, 2)
USING total_category_miscellaneous_foods::numeric(9, 2);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_food_away_from_home
SET DATA TYPE numeric(10, 2)
USING total_category_food_away_from_home::numeric(10, 2);

ALTER TABLE consumer_expenditures_2gb
ALTER COLUMN total_category_alcoholic_beverages
SET DATA TYPE numeric(9, 2)
USING total_category_alcoholic_beverages::numeric(9, 2);
