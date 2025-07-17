-- dbt model to create a table `fact_genome_scores` in the Snowflake `gold` schema
-- using data from the `source_genome_scores` which is in the `silver` schema

SELECT
    MOVIE_ID,
    TAG_ID,
    RELEVANCE
FROM {{ source('movie_dataset_silver', 'source_genome_scores') }} 

