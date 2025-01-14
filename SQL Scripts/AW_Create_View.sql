-- CREATE VIEW CUSTOMERS

CREATE VIEW gold.customers
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://awstorageaccountdata.dfs.core.windows.net/silver/AW_Customers',
            FORMAT = 'PARQUET'
        ) as Customer_Data;

-- CREATE VIEW PRODUCTS_SUBCATEGORIES

CREATE VIEW gold.product_subcategories
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://awstorageaccountdata.dfs.core.windows.net/silver/AW_Product_Subcategories',
            FORMAT = 'PARQUET'
        ) as Pro_sub;

-- CREATE VIEW PRODUCTS

CREATE VIEW gold.products
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://awstorageaccountdata.dfs.core.windows.net/silver/AW_Products',
            FORMAT = 'PARQUET'
        ) as product;

-- CREATE VIEW RETURNS

CREATE VIEW gold.returns
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://awstorageaccountdata.dfs.core.windows.net/silver/AW_Returns',
            FORMAT = 'PARQUET'
        ) as returns;

-- CREATE VIEW SALES_2016

CREATE VIEW gold.sales16
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://awstorageaccountdata.dfs.core.windows.net/silver/AW_Sales_2016',
            FORMAT = 'PARQUET'
        ) as sales16;

-- CREATE VIEW TERRITORIES

CREATE VIEW gold.territories
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://awstorageaccountdata.dfs.core.windows.net/silver/AW_Territories',
            FORMAT = 'PARQUET'
        ) as territories;