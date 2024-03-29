USE ROLE MODEANALYTICS_R1;

USE WAREHOUSE MODEANALYTICS_VW_XSmall;

SELECT
  O_ORDERSTATUS,
  O_ORDERPRIORITY,
  year(O_ORDERDATE),
  L_RETURNFLAG,
  L_SHIPINSTRUCT,
  L_SHIPMODE,
  L_QUANTITY
FROM
  SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.LINEITEM
  RIGHT OUTER JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS ON (LINEITEM.L_ORDERKEY = ORDERS.O_ORDERKEY)