-- dbt model to create a table `dim_genome_tags` in the Snowflake `gold` schema
-- using data from the `source_genome_tags` table in the `silver` schema

SELECT tag_id,
tag from {{ source('movie_dataset_silver','source_genome_tags') }}