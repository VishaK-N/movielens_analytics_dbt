
  
    

        create or replace transient table DBT_PROJECT.MOVIE_DATASET_GOLD_movie_dataset_gold.dim_genome_tags
         as
        (SELECT tag_id,
tag from DBT_PROJECT.MOVIE_DATASET_SILVER.source_genome_tags
        );
      
  