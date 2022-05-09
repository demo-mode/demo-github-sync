--- This is 
SELECT
  *
FROM
  MODE.dunder_mifflin_paper_sales
WHERE
  account_manager IN ({{ acct_mgr }}) AND status IN ({{order_status}})
  
  
