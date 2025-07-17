-- dbt model to create a table `fact_ratings` in the Snowflake `gold` schema
-- using data from the `source_ratings` which is in the `silver` schema

-- here the materialization is incremental, (i.e) the data will be incrementally loaded
-- based on the condition RATING_TIMESTAMP >= (SELECT MAX(RATING_TIMESTAMP)



SELECT
    USER_ID,
    MOVIE_ID,
    RATING_GIVEN as RATING,
    RATING_TIMESTAMP,
    TO_DATE(RATING_TIMESTAMP) AS RATING_DATE,
    TO_CHAR(RATING_TIMESTAMP, 'HH24:MI:SS') AS RATING_TIME
FROM DBT_PROJECT.MOVIE_DATASET_SILVER.source_ratings
WHERE RATING_GIVEN IS NOT NULL 


  AND RATING_TIMESTAMP >= (SELECT MAX(RATING_TIMESTAMP) FROM DBT_PROJECT.movie_dataset_gold.fact_ratings)
