
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select tag_id
from DBT_PROJECT.movie_dataset_gold.fact_genome_scores
where tag_id is null



  
  
      
    ) dbt_internal_test