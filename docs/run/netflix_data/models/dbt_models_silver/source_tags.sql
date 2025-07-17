
  
    

        create or replace transient table DBT_PROJECT.MOVIE_DATASET_SILVER.source_tags
         as
        (with raw_tags as (
    select * from DBT_PROJECT.MOVIE_DATASET_BRONZE.raw_tags
)

select userid as user_id, movieid as MOVIE_ID, tag,
to_timestamp_ltz(timestamp) as tag_timestamp
from raw_tags
        );
      
  