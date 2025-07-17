-- implementing a snapshot (Slowly Changing dimension)
-- here the strategy is check and the column need to be checked is location based on the unique_key='user_id'
-- so, if there is any change in the location, then it will create a new row 
-- where the valid_to column of the old record will be current_time and
-- new record will the have the null value in the valid_to column 

{% snapshot user_snapshot %}

{{
  config(
    target_schema='movie_dataset_snapshot',  
    unique_key='user_id',
    strategy='check',
    check_cols=['location']
  )
}}

SELECT
    user_id,
    user_name,
    age,
    location
FROM {{ ref('dim_users') }}

{% endsnapshot %}    



