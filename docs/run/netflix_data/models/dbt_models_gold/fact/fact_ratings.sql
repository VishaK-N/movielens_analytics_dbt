-- back compat for old kwarg name
  
  begin;
    

        insert into DBT_PROJECT.movie_dataset_gold.fact_ratings ("USER_ID", "MOVIE_ID", "RATING", "RATING_TIMESTAMP", "RATING_DATE", "RATING_TIME")
        (
            select "USER_ID", "MOVIE_ID", "RATING", "RATING_TIMESTAMP", "RATING_DATE", "RATING_TIME"
            from DBT_PROJECT.movie_dataset_gold.fact_ratings__dbt_tmp
        );
    commit;