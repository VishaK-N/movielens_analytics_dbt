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



