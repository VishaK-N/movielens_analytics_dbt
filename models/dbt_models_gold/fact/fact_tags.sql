-- dbt model to create a table `fact_tags` in the Snowflake `gold` schema
-- using data from the `source_tags` which is in the `silver` schema

SELECT
    USER_ID,
    MOVIE_ID,
    TAG,
    TAG_TIMESTAMP,
    TO_DATE(TAG_TIMESTAMP) AS TAG_DATE,                  -- extracting only the date
    TO_CHAR(TAG_TIMESTAMP, 'HH24:MI:SS') AS TAG_TIME     -- extracting only the time
FROM {{ source('movie_dataset_silver', 'source_tags') }}
