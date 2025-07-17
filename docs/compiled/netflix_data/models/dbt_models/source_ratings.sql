with raw_ratings as(
    select * from DBT_PROJECT.MOVIE_DATASET.RAW_RATINGS
)

select userid as user_id, movieid as movie_id, rating,
timestamp as time_stamp
from raw_ratings