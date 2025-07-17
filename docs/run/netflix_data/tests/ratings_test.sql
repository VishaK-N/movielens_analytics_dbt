
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  -- creating a singular test , if there is an value which violates this test
-- then there will be an error
-- ratings should be between 0 and 5, if it returns any value then there is an error

SELECT *
FROM DBT_PROJECT.movie_dataset_gold.fact_ratings
WHERE rating < 0 OR rating > 5
  
  
      
    ) dbt_internal_test