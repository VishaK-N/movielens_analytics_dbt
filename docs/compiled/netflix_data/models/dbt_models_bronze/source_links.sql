with raw_links as (
    select * from DBT_PROJECT.MOVIE_DATASET_BRONZE.RAW_LINKS
)

select movieid as MOVIE_ID,
imdbid as IMDB_ID,tmdbid as TMDB_ID
from raw_links