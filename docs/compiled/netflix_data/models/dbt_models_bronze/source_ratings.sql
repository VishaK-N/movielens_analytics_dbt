with raw_ratings as(
    select * from DBT_PROJECT.MOVIE_DATASET_BRONZE.RAW_RATINGS
)

select userid as user_id, movieid as movie_id, rating,
to_timestamp_ltz(timestamp) as rating_timestamp
from raw_ratings