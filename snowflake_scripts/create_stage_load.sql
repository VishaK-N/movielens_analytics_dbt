-- creating the stage in snowflake to connect with Azure bolb storage

-- 
CREATE OR REPLACE STAGE moviedatastage
 URL='azure://dbtprojectdataset.blob.core.windows.net/sourcedata'          
CREDENTIALS=(AZURE_SAS_TOKEN='?sv=2024-11-04&ss=bfqt&srt=sco&sp=rwdlacupyx&se=2025-06-23T11:55:28Z&st=2025-06-23T03:55:28Z&spr=https&sig=%2FoegzurgisU8kF0tpLZhJflQlhM%2BFY4hdQoPH9YxOjA%3D')
 FILE_FORMAT=(TYPE='CSV');

-- checking for the files available in the stage
LIST @moviedatastage;

-- creating the movies table in the snowflake datawarehouse
 CREATE OR REPLACE TABLE raw_movies (
  movieId INTEGER,
  title STRING,
  genres STRING
);

-- copying the data from ADLS to the created movies table
COPY INTO raw_movies
FROM @moviedatastage/Movie_dataset/movies.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"')
FORCE = TRUE;

-- querying some data from the movies table
select * from raw_movies
where genres = 'Adventure';


-- creating the ratings table in the snowflake datawarehouse
CREATE OR REPLACE TABLE raw_ratings (
  userId INTEGER,
  movieId INTEGER,
  rating FLOAT,
  timestamp BIGINT
);

-- copying the raw rating files
copy into raw_ratings
from @moviedatastage/Movie_dataset/ratings.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"')

select * from raw_ratings;

-- creating the tags table in the snowflake datawarehouse
CREATE OR REPLACE TABLE raw_tags (
  userId INTEGER,
  movieId INTEGER,
  tag STRING,
  timestamp BIGINT
);


-- copying the data from ADLS to the created tags table
copy into raw_tags
from @moviedatastage/Movie_dataset/tags.csv
FILE_FORMAT= (TYPE= 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"')
ON_ERROR = 'CONTINUE';

-- creating the tags table in the snowflake datawarehouse
CREATE OR REPLACE TABLE raw_links(
  movieId INTEGER,
  imdbId INTEGER,
  tmdbId INTEGER
)

-- copying the data from ADLS to the created links table
copy into raw_links
from @moviedatastage/Movie_dataset/links.csv
FILE_FORMAT = ( TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"')


-- creating the genome_scores table in the snowflake datawarehouse
CREATE OR REPLACE TABLE raw_genome_scores(
  movieId INTEGER,
  tagId INTEGER,
  relevance FLOAT
)

-- copying the data from ADLS to the created genome_scores table
copy into raw_genome_scores
from @moviedatastage/Movie_dataset/genome-scores.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"')

-- creating the genome_tags table in the snowflake datawarehouse

create or replace table raw_genome_tags(
tagId INTEGER,
tag STRING
)

-- copying the data from ADLS to the created genome_tags table
copy into raw_genome_tags
from @moviedatastage/Movie_dataset/genome-tags.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"')

Drop view Source_ratings;
