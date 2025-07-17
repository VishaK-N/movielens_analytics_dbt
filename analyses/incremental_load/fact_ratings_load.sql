-- checking the latest rated details (based on the time)

select * from fact_ratings 
order by rating_timestamp desc
LIMIT 3;

select * from fact_ratings 
where rating_timestamp = '2015-03-31 23:11:28.000 -0700';


select * from fact_ratings 
where rating_timestamp = '2015-03-30 23:40:02.000 -0700';

SELECT MAX(rating_timestamp) FROM fact_ratings;

