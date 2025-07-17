-- dbt model to create a table `source_links` in the Snowflake `silver` schema
-- using data from the `raw_links` table in the `raw` schema

with raw_links as (
    select * from DBT_PROJECT.MOVIE_DATASET_BRONZE.RAW_LINKS
)

select movieid as MOVIE_ID,
imdbid as IMDB_ID,tmdbid as TMDB_ID
from raw_links