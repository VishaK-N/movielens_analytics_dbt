with raw_ratings as(
    select * from {{ source('movie_dataset_bronze','raw_ratings') }}
)

select userid as user_id, movieid as movie_id, rating as rating_given,
to_timestamp_ltz(timestamp) as rating_timestamp
from raw_ratings
