-- models/dim_movies.sql
WITH movies AS (
    SELECT
        MOVIE_ID,
        TITLE,
        REGEXP_SUBSTR(TITLE, '\\d{4}') AS RELEASED_YEAR,
        GENRES ,
        CASE 
            WHEN GENRES LIKE '%|%' THEN 'Yes'
            ELSE 'No'
        END AS IS_MULTI_GENRE,
    FROM {{ source('movie_dataset_silver','source_movies') }}
),
movie_links AS (
    SELECT
        MOVIE_ID,
        IMDB_ID,
        TMDB_ID
    FROM {{ source('movie_dataset_silver','source_links') }}
)
SELECT
    m.MOVIE_ID,
    m.TITLE,
    m.RELEASED_YEAR,
    m.GENRES, 
    m.IS_MULTI_GENRE,
    l.IMDB_ID,
    l.TMDB_ID
FROM movies m
LEFT JOIN movie_links l ON m.MOVIE_ID = l.MOVIE_ID
