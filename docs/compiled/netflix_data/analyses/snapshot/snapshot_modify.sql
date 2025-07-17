-- updating the new value 'location = Chennai' where the user_id = 35581

-- using the select command to see the list
select * from dim_users where user_name is NOT NULL;

-- inserting or updating the new value(location) where user_id = 35581

select * from dim_users where user_id = 35581;

update dim_users set location = 'Chennai' where user_id = 35581;

-- inserting or updating the new value(location) where user_id = 109218

update dim_users set located_at = 'Coimbatore' where user_id = 109218;

select * from dim_users where user_id = 109218;