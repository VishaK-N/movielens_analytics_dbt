-- checking the latest rated details (based on the time) in the source file
-- same as the fact_ratings table

select * from source_ratings
order by rating_timestamp desc
LIMIT 3;

-- now inserting the value to check the incremental loading materialization in fact_ratings
INSERT INTO source_ratings values(89081,52458,4,'2015-03-31 23:11:28.000 -0700');


-- adding the already available data
INSERT INTO source_ratings values(8758,7151,4.5,'2015-03-30 23:40:02.000 -0700');

select * from source_ratings 
where rating_timestamp = '2015-03-31 23:11:28.000 -0700';

select * from source_ratings 
where rating_timestamp = '2015-03-30 23:40:02.000 -0700';
