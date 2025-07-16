with raw_movies as(
    select * from DBT_PROJECT.MOVIE_DATASET_BRONZE.RAW_MOVIES
)

SELECT movieid as MOVIE_ID, TITLE, GENRES
from raw_movies

