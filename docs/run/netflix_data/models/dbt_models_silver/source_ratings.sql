
  
    

        create or replace transient table DBT_PROJECT.movie_dataset_silver.source_ratings
         as
        (with raw_ratings as(
    select * from DBT_PROJECT.MOVIE_DATASET_BRONZE.raw_ratings
)

select userid as user_id, movieid as movie_id, rating as rating_given,
to_timestamp_ltz(timestamp) as rating_timestamp
from raw_ratings
        );
      
  