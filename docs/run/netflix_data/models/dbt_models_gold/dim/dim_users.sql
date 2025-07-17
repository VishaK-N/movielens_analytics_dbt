
  
    

        create or replace transient table DBT_PROJECT.movie_dataset_gold.dim_users
         as
        (SELECT distinct u.user_id , ui.user_name, ui.age, ui.location as located_at
from DBT_PROJECT.MOVIE_DATASET_SILVER.source_ratings as u
LEFT JOIN  DBT_PROJECT.MOVIE_DATASET_BRONZE.user_information as ui
on u.user_id = ui.user_id
        );
      
  