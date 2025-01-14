CREATE MASTER KEY ENCRYPTION BY PASSWORD ='Roni@12345'

CREATE DATABASE SCOPED CREDENTIAL credential_data
WITH
    IDENTITY = 'Managed Identity'

CREATE EXTERNAL DATA SOURCE source_silver
WITH
(
    LOCATION = 'https://awstorageaccountdata.dfs.core.windows.net/silver',
    CREDENTIAL = credential_data
)

CREATE EXTERNAL DATA SOURCE source_gold
WITH
(
        LOCATION = 'https://awstorageaccountdata.dfs.core.windows.net/gold',
        CREDENTIAL = credential_data
)

CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

-- CREATE EXTERNAL TABLES EXT_SALES

CREATE EXTERNAL TABLE gold.ext_sales
WITH
(
    LOCATION = 'ext_sales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS
SELECT * FROM gold.sales16;

SELECT * FROM gold.ext_sales;