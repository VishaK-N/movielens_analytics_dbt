# 🎬 Movielens Data Analytics project using Data Build Tool
This project is developed to perform the movie analysis on the historical data. In this the data is sourced, cleaned, and loaded in the data warehouse. From there, the data is analyzed to find patterns, and also we can build a movie recommendation system.

## 📊 Project flow:
📁 ADLS → 🚰 Airbyte → ❄ Snowflake[🟫 Bronze] --(DBT)-→ ❄ Snowflake[🥈 Silver] --(DBT)-→  ❄ Snowflake[🥇 GOLD]

In this project, I have connected the Gold layer with **AskYourDatabase**, enabling text-to-SQL querying 🗣️➡️📊 without the need to manually write SQL scripts 📝❌.

- First the data will be in the Azure Data Lake
- Then using Airbyte (EL Tool), data will be ingested and loaded into Snowflake (Bronze) **OR**
- In Snowflake, creating a stage would help to fetch the data from the ADLS container
- From there, data is transformed using DBT and moved through different layers,
- The final output will be in Fact and Dimensional Tables (in the Gold layer)

---

## 🧰 Tech Stack Learned:
- 🛠️ DBT (Data Build Tool)
- ☁️ Azure Data Lake
- ❄️ Snowflake
- 🔄 Airbyte
- 🐙 GitHub
- 🤖 AskYourDatabase

---

## Getting started 

Steps to intiate the project

### 🚀 Step 1: Create the required Installations
- 🔧 Install the DBT account locally
- 🌐 Create accounts on the following platforms:
   - Azure Cloud – for storage (ADLS)
   - Snowflake – for data warehousing
   - Airbyte – for data ingestion
   - AskYourDatabase – for text-to-SQL querying on top of Snowflake
     
### Step 2: Create the Azure Container (ADLS)
- Creating the conatiner is necessary, that act as a source in this project
<img src="ScreenShots/source_container_ss.png" alt="source_container" width="500">

### 🔗 Step 3: Create the Airbyte Connection or Creata a Stage in Snowflake
- option1 : Implement a connection between Azure container and Snowflake to transfer the data **OR**
- option2 : Create a Stage in Snowfalke with ADLS and copy the file from ADLS to Snowflake
- ✅ Make Sure to load the data into the `bronze Schema`

### 🏗️ Step 4: Create database and schema in the Snowflake
- Create a new database
    - `DBT Project`
- Within that database Create schemas
    - `MOVIE_DATASET_BRONZE`
    - `MOVIE_DATASET_SIVLER`
    - `MOVIE_DATASET_GOLD`
  
### Step 5: Create dbt models (which load the transformed data into the `MOVIE_DATASET_SIVLER`)
- Create a folder **dbt_models_silver** under the models folder
- Creata dbt models with select command and make some changes  like cleaning and changing some naming convention
- Source of the model should be the Bronze data from the Snowflake
- Run the dbt models and it should be loading the data into the Silver layer of Snowflake

- **📌 Notes**
- Define sources in the `source.yml` file to allocate source storage.
- To load data into a specific storage, update the schema value in the dbt_project.yml file.
- To enable custom schema logic, create the appropriate macros (UDF) script in the macros/ directory.

### 🛠️ Step 6: Create dbt models (Loading transformed data into the `MOVIE_DATASET_GOLD`)
- Create a folder **dbt_models_gold** under the models folder
- Within that creating a dim and fact folder

#### 📘 DIM Models
- `dim_genome_tags`: source_genome_tags will be the source
- `dim_movies`:
   - Joins `source_movies` and `source_links`.
   - Derives new columns:
       - `RELEASED_YEAR`
       - `IS_MULTI_GENRE`
- `dim_users`:
    - Joins `source_ratings` with `user_information` (which is stored as a seed in dbt).
  
#### 📗 Fact Models
- `fact_genome_scores`: `source_genome_scores` will be the source.
- `fact_ratings`:
    - Uses **incremental materialization**
    - Loads data where `RATING_TIMESTAMP >= (SELECT MAX(RATING_TIMESTAMP))`, ensuring new data is added and existing records are updated.
- `fact_tags`: source_tags will be the source
- Source of the model should be the Silver layer data from the Snowflake
- Run the dbt models and it should be loading the data into the Gold layer of Snowflake

- **📌 Notes**
- Same as the silver folder, source and customer schema is applied here.
  
* Finally, there will be Galaxy Schema model in the Gold layer of the Snowflake. 

### 🔗 Step 7: Connecting the Snowflake schema with AskYourDatabase
- In the AskYourDatabase, create SQL AI bot with Snowflake Goldlayer as the Datasource
- This allows text-to-SQL querying without writing manual SQL, enabling easy access to insights directly from the Gold layer.

### Step 8: Implementing the Testing and Snapshot
##### 📌SnapShot
- Creating a Snapshot (SCD type 2), which will have the track is of the location of the user.
- If the user change the location, New record will be the created and valid_to will be null
- And valid_to previous location will set to the current time
- Command used: **dbt snapshot**

##### 🧪Testing
- Creating a schema.yml where the generic test like constraints- unique, not null, ref key will be defined.
- Creating a singular test for the customized testing, here ratings should be between 0 and 5, if it returns any value then there is an error.
- Command used: **dbt test**

---

 ### 🚀 USAGE
 ##### Workflow of the project

 - Files will be loaded in the ADLS containers
 - Transfering the data using Airbyte or Snowfalke Stage
 - Data transformation by DBT from `Bronze to Silver` and `Silver to Gold`
 - Text-to-SQL querying with the help of AskYourDatabase.
   
---

 ### 📄 Documention
 - dbt offers the auto documention, it will completely create a documention based on the work we have done.

 - Access the live dbt documentation here:  
👉 [Click for dbt docs](https://vishak-n.github.io/movielens_analytics_dbt/)

---









  




