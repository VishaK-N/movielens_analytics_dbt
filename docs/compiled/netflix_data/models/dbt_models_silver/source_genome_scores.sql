-- dbt model to create a table `source_genome_scores` in the Snowflake `silver` schema
-- using data from the `raw_genome_scores` table in the `raw` schema

with raw_genome_scores as(
    select * from DBT_PROJECT.MOVIE_DATASET_BRONZE.raw_genome_scores
)

select movieid as MOVIE_ID, tagid as tag_id,
relevance from raw_genome_scores