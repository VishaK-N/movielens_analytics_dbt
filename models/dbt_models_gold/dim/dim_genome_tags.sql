SELECT tag_id,
tag from {{ source('movie_dataset_silver','source_genome_tags') }}