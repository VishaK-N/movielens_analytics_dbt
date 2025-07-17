# 🎬 Movielens Data Analytics project using Data Build Tool
This project is developed to perform the movie analysis on the historical data. In this the data is sourced, cleaned, and loaded in the data warehouse. From there, the data is analyzed to find patterns, and also we can build a movie recommendation system.

## 📊 Project flow:
📁 ADLS → 🚰 Airbyte → ❄ Snowflake (DBT) [🟫 Bronze] → ❄ Snowflake (DBT) [🥈 Silver] → ❄ Snowflake (DBT) [🥇 GOLD]

In this project, I have connected the Gold layer with AskYourDatabase, enabling text-to-SQL querying 🗣️➡️📊 without the need to manually write SQL scripts 📝❌.

- First the data will be in the Azure Data Lake
- Then using Airbyte (EL Tool), data will be ingested and loaded into Snowflake (Bronze)
- In Snowflake, creating a stage would help to fetch the data from the ADLS container
- From there, data is transformed using DBT and moved through different layers,
- The final output will be in Fact and Dimensional Tables (in the Gold layer)
