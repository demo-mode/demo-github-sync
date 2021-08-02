WITH 
  signups AS (
    SELECT *,
           MIN(occurred_at) OVER (PARTITION BY user_id) AS signup_date
      FROM johnny_kelley.product_analytics_events
     ORDER BY user_id
  ),
  
  with_month AS (
    SELECT *,
           DATE_TRUNC('month',signup_date) AS signup_month
      FROM signups
  ),
  
  with_rank AS (
    SELECT *,
           TO_CHAR(signup_month, 'YYYY MM') AS month_str,
           DENSE_RANK() OVER (ORDER BY signup_month DESC) AS month_rank
      FROM with_month
  )
  
    SELECT *,
           month_rank || '. ' || TO_CHAR(signup_month, 'Mon YYYY') AS month
      FROM with_rank