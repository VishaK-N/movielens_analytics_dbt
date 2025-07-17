-- dbt model to create a table `source_movies` in the Snowflake `silver` schema
-- using data from the `raw_movies` table in the `raw` schema

with raw_movies as(
    select * from DBT_PROJECT.MOVIE_DATASET_BRONZE.RAW_MOVIES
)

SELECT movieid as MOVIE_ID, TITLE, GENRES
from raw_movies

