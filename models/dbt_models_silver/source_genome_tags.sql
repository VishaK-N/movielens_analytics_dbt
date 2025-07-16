with raw_genome_tags as(
    select * from {{ source('movie_dataset_bronze','raw_genome_tags') }}
)
select tagid as tag_id,
tag from raw_genome_tags

