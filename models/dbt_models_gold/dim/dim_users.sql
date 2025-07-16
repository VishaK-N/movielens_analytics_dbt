
SELECT distinct u.user_id , ui.user_name, ui.age, ui.location as located_at
from {{ source('movie_dataset_silver','source_ratings') }} as u
LEFT JOIN  {{ ref('user_information') }} as ui
on u.user_id = ui.user_id