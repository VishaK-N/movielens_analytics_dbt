
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select tag
from DBT_PROJECT.movie_dataset_gold.dim_genome_tags
where tag is null



  
  
      
    ) dbt_internal_test