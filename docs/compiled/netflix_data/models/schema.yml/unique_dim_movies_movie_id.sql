
    
    

select
    movie_id as unique_field,
    count(*) as n_records

from DBT_PROJECT.movie_dataset_gold.dim_movies
where movie_id is not null
group by movie_id
having count(*) > 1


