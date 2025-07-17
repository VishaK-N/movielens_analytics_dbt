-- after running the dbt fact_ratings model,
-- we would only get only the record '2015-04-30 23:11:28.000 -0700' based on the condition

select * from fact_ratings
where RATING_TIMESTAMP = '2015-04-30 23:11:28.000 -0700' or 
RATING_TIMESTAMP = '2015-03-29 23:40:02.000 -0700';