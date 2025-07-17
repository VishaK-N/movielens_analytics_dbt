
  
    

        create or replace transient table DBT_PROJECT.MOVIE_DATASET_GOLD.fact_tags
         as
        (-- models/dbt_models_gold/fact/fact_tags.sql

SELECT
    USER_ID,
    MOVIE_ID,
    TAG,
    TAG_TIMESTAMP,
    TO_DATE(TAG_TIMESTAMP) AS TAG_DATE,
    TO_CHAR(TAG_TIMESTAMP, 'HH24:MI:SS') AS TAG_TIME
FROM DBT_PROJECT.MOVIE_DATASET_SILVER.source_tags
        );
      
  