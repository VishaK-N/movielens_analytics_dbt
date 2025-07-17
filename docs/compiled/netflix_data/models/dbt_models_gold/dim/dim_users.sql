-- dbt model to create a table `dim_users` in the Snowflake `gold` schema
-- using data from the `source_ratings` in the `silver` schema and 
-- `user_information` from the seed folder

SELECT distinct u.user_id , ui.user_name, ui.age, ui.location as located_at
from DBT_PROJECT.MOVIE_DATASET_SILVER.source_ratings as u
LEFT JOIN  DBT_PROJECT.MOVIE_DATASET_BRONZE.user_information as ui
on u.user_id = ui.user_id