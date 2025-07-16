-- models/dbt_models_gold/fact/fact_genome_scores.sql

SELECT
    MOVIE_ID,
    TAG_ID,
    RELEVANCE
FROM {{ source('movie_dataset_silver', 'source_genome_scores') }} 

