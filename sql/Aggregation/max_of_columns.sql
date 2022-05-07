SELECT *
FROM consumer_expenditures_2gb
LIMIT 1;

SELECT 
	MAX(subset.total_category_food_at_home) AS total_category_food_at_home, MAX(subset.total_category_cereal_and_cereal_products) AS total_category_cereal_and_cereal_products, MAX(subset.total_category_bakery_products) AS total_category_bakery_products, 
	MAX(subset.total_category_expenditures_on_beef) AS total_category_expenditures_on_beef, MAX(subset.total_category_pork) AS total_category_pork, MAX(subset.total_category_other_meats) AS total_category_other_meats, 
	MAX(subset.total_category_poultry) AS total_category_poultry, MAX(subset.total_category_fish_and_seafood) AS total_category_fish_and_seafood, MAX(subset.total_category_eggs) AS total_category_eggs, 
	MAX(subset.total_category_fresh_milk_and_cream) AS total_category_fresh_milk_and_cream, MAX(subset.total_category_other_dairy_products) AS total_category_other_dairy_products, MAX(subset.total_category_fresh_fruits) AS total_category_fresh_fruits,  
	MAX(subset.total_category_fresh_vegetables) AS total_category_fresh_vegetables, MAX(subset.total_category_processed_fruits) AS total_category_processed_fruits, MAX(subset.total_category_processed_vegetables) AS total_category_processed_vegetables, 
	MAX(subset.total_category_sugar_and_other_sweets) AS total_category_sugar_and_other_sweets, MAX(subset.total_category_nonalcoholic_beverages) AS total_category_nonalcoholic_beverages, MAX(subset.total_category_fats_and_oils) AS total_category_fats_and_oils,  
	MAX(subset.total_category_miscellaneous_foods) AS total_category_miscellaneous_foods, MAX(subset.total_category_food_away_from_home) AS total_category_food_away_from_home, MAX(subset.total_category_alcoholic_beverages) AS total_category_alcoholic_beverages
FROM
(SELECT 
	total_category_food_at_home::double precision, 
	total_category_cereal_and_cereal_products::double precision, 
	total_category_bakery_products::double precision, 
	total_category_expenditures_on_beef::double precision, 
	total_category_pork::double precision, 
	total_category_other_meats ::double precision, 
	total_category_poultry::double precision, 
	total_category_fish_and_seafood::double precision,
	total_category_eggs::double precision,
	total_category_fresh_milk_and_cream ::double precision, 
	total_category_other_dairy_products::double precision,
	total_category_fresh_fruits::double precision,
	total_category_fresh_vegetables ::double precision, 
 	total_category_processed_fruits::double precision,
	total_category_processed_vegetables::double precision, 
	total_category_sugar_and_other_sweets::double precision,
	total_category_nonalcoholic_beverages ::double precision, 
	total_category_fats_and_oils::double precision,
	total_category_miscellaneous_foods::double precision,
	total_category_food_away_from_home ::double precision, 
	total_category_alcoholic_beverages::double precision
FROM consumer_expenditures_2gb) AS subset
;