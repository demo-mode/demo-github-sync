

-- SELECT  CONCAT(grp_id*10+CASE WHEN grp_id>0 THEN 1 ELSE 0 END,'-',(grp_id+1)*10) as "Range",cnt,retained, churn, retained/cnt::FLOAT as "rate of retention"
-- FROM
-- (
--   SELECT 
--   floor(CASE WHEN churn.tenure-1<0 THEN 0 ELSE (churn.tenure-1)/10 END) as "grp_id",
--   COUNT(churn.customer_id) as cnt, 
--   SUM(CASE WHEN churn.churn = 'Yes' THEN 1 ELSE 0 END) as "retained",
--   SUM(CASE WHEN churn.churn = 'No' THEN 1 ELSE 0 END) as "churn"
--   FROM tutorial.wa_fn_usec_telco_customer_churn_wa_fn_usec_telco_customer_churn churn
--   GROUP BY floor(CASE WHEN churn.tenure-1<0 THEN 0 ELSE (churn.tenure-1)/10 END)
-- ) a
 
 
 

SELECT  *, CONCAT(grp_id*10+CASE WHEN grp_id>0 THEN 1 ELSE 0 END,'-',(grp_id+1)*10) as "range"
FROM
(
  SELECT 
  *, floor(CASE WHEN churn.tenure-1<0 THEN 0 ELSE (churn.tenure-1)/10 END) as "grp_id"
  FROM tutorial.wa_fn_usec_telco_customer_churn_wa_fn_usec_telco_customer_churn churn
) a