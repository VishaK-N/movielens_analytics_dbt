-- testing the SCD type 2 by inserting the new record to the dim_users table 
-- and running the snapshot again

select * from user_snapshot
where user_name is not null;

-- checking with the user_id  35581, where the location changed to chennai

select * from user_snapshot where user_id = 35581;

-- checking with the user_id  109218, where the location changed to Coimbatore from Delhi

select * from user_snapshot where user_id = 109218;