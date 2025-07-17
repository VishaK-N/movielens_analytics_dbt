
    
    

with child as (
    select movie_id as from_field
    from DBT_PROJECT.movie_dataset_gold.fact_ratings
    where movie_id is not null
),

parent as (
    select movie_id as to_field
    from DBT_PROJECT.movie_dataset_gold.dim_movies
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


