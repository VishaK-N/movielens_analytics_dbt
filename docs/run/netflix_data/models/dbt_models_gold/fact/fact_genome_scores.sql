
  
    

        create or replace transient table DBT_PROJECT.MOVIE_DATASET_GOLD.fact_genome_scores
         as
        (-- models/dbt_models_gold/fact/fact_genome_scores.sql

SELECT
    MOVIE_ID,
    TAG_ID,
    RELEVANCE
FROM DBT_PROJECT.MOVIE_DATASET_SILVER.source_genome_scores
        );
      
  