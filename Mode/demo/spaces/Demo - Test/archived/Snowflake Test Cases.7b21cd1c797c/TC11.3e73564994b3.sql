USE ROLE MODEANALYTICS_R1;

USE WAREHOUSE MODEANALYTICS_VW_XSmall;

SELECT
  C_MKTSEGMENT,
  C_NAME,
  C_ACCTBAL,
  C_ADDRESS,
  C_COMMENT
FROM
  SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER
WHERE
  C_ACCTBAL > 4000