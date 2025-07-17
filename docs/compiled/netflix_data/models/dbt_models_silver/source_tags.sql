-- dbt model to create a table `source_tags` in the Snowflake `silver` schema
-- using data from the `raw_tags` table in the `raw` schema

with raw_tags as (
    select * from DBT_PROJECT.MOVIE_DATASET_BRONZE.raw_tags
)

select userid as user_id, movieid as MOVIE_ID, tag,
to_timestamp_ltz(timestamp) as tag_timestamp -- converting to timestamp
from raw_tags