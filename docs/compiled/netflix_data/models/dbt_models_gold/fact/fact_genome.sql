-- models/dbt_models_gold/fact/fact_genome_scores.sql

SELECT
    s.MOVIE_ID,
    s.TAG_ID,
    t.TAG,
    s.RELEVANCE
FROM DBT_PROJECT.MOVIE_DATASET_SILVER.source_genome_scores s
LEFT JOIN DBT_PROJECT.MOVIE_DATASET_SILVER.source_genome_tags t
  ON s.TAG_ID = t.TAG_ID