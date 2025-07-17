
  
    

        create or replace transient table DBT_PROJECT.MOVIE_DATASET_SILVER.source_genome_scores
         as
        (with raw_genome_scores as(
    select * from DBT_PROJECT.MOVIE_DATASET_BRONZE.raw_genome_scores
)

select movieid as MOVIE_ID, tagid as tag_id,
relevance from raw_genome_scores
        );
      
  