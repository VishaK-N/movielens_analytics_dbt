with raw_genome_tags as(
    select * from DBT_PROJECT.MOVIE_DATASET_BRONZE.raw_genome_tags
)
select tagid as tag_id,
tag from raw_genome_tags