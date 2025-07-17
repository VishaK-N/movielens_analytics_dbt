
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select tag_id as from_field
    from DBT_PROJECT.movie_dataset_gold.fact_genome_scores
    where tag_id is not null
),

parent as (
    select tag_id as to_field
    from DBT_PROJECT.movie_dataset_gold.dim_genome_tags
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test