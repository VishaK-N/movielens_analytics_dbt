-- dbt model to create a table `source_ratings` in the Snowflake `silver` schema
-- using data from the `raw_ratings` table in the `raw` schema

with raw_ratings as(
    select * from DBT_PROJECT.MOVIE_DATASET_BRONZE.raw_ratings
)

select userid as user_id, movieid as movie_id, rating as rating_given,
to_timestamp_ltz(timestamp) as rating_timestamp -- converting to timestamp
from raw_ratings