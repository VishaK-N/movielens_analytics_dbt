-- dbt model to create a table `source_genome_tags` in the Snowflake `silver` schema
-- using data from the `raw_genome_tags` table in the `raw` schema

with raw_genome_tags as(
    select * from DBT_PROJECT.MOVIE_DATASET_BRONZE.raw_genome_tags
)
select tagid as tag_id,
tag from raw_genome_tags