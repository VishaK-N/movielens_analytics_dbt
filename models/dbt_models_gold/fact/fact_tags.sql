-- models/dbt_models_gold/fact/fact_tags.sql

SELECT
    USER_ID,
    MOVIE_ID,
    TAG,
    TAG_TIMESTAMP,
    TO_DATE(TAG_TIMESTAMP) AS TAG_DATE,
    TO_CHAR(TAG_TIMESTAMP, 'HH24:MI:SS') AS TAG_TIME
FROM {{ source('movie_dataset_silver', 'source_tags') }}
