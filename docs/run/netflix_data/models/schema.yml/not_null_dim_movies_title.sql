
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select title
from DBT_PROJECT.movie_dataset_gold.dim_movies
where title is null



  
  
      
    ) dbt_internal_test