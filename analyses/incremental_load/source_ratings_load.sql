-- As per the current this is the recent time that the file has been uploaded
-- "" 2015-03-30 23:40:02.000 -0700 ""

select rating_timestamp  from source_ratings
order by rating_timestamp desc
limit 3;


-- now inserting the value to check the incremental loading materialization in fact_ratings
INSERT INTO source_ratings values(87654,52458,4,'2015-04-30 23:11:28.000 -0700');


-- adding the already available data
INSERT INTO source_ratings values(87654,7151,4.5,'2015-03-29 23:40:02.000 -0700');

-- both the records has been added
-- next step running fact_ratings model in dbt which load the data incrementally
-- let's check 87654 id only (87654,52458,4,'2015-04-30 23:11:28.000 -0700') this value should be found