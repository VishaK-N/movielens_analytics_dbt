-- models/dbt_models_gold/fact/fact_ratings.sql

{{ config(
    materialized = 'incremental',
    on_schema_change = 'fail'
) }}

SELECT
    USER_ID,
    MOVIE_ID,
    RATING,
    RATING_TIMESTAMP,
    TO_DATE(RATING_TIMESTAMP) AS RATING_DATE,
    TO_CHAR(RATING_TIMESTAMP, 'HH24:MI:SS') AS RATING_TIME
FROM {{ source('movie_dataset_silver', 'source_ratings') }}
WHERE RATING IS NOT NULL

{% if is_incremental() %}
  AND RATING_TIMESTAMP >= (SELECT MAX(RATING_TIMESTAMP) FROM {{ this }})
{% endif %}
