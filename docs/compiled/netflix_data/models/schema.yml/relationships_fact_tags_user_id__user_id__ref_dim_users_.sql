
    
    

with child as (
    select user_id as from_field
    from DBT_PROJECT.movie_dataset_gold.fact_tags
    where user_id is not null
),

parent as (
    select user_id as to_field
    from DBT_PROJECT.movie_dataset_gold.dim_users
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


