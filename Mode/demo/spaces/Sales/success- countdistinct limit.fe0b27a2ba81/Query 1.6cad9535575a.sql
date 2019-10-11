select da.d_date, ss_sold_date_sk, ss_item_sk, ss_customer_sk, ss_ticket_number 
from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.STORE_SALES st
join SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.DATE_DIM da
on st.SS_SOLD_DATE_SK = da.D_DATE_SK

limit 15000000