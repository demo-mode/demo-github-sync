USE ROLE MODEANALYTICS_R1;
USE WAREHOUSE MODEANALYTICS_VW_XSmall;

SELECT r.R_NAME as "Region", c.C_NAME as "Customer Name", COUNT(DISTINCT o.O_ORDERKEY) as "Order Key"
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.NATION n
INNER JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER c 
ON n.N_NATIONKEY = c.C_NATIONKEY 
INNER JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS o 
ON c.C_CUSTKEY = o.O_CUSTKEY 
INNER JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.REGION r 
ON n.N_REGIONKEY = r.R_REGIONKEY 

GROUP BY 1,2