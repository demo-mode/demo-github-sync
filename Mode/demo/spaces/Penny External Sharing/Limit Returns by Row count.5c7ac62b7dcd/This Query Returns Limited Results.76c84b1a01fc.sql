WITH state_count AS (
  SELECT
    order_id,
    shipping_state,
    COUNT(*) OVER(PARTITION BY shipping_state) num_in_state
  FROM
    MODE.dunder_mifflin_paper_sales
),
acct_manager_count AS (
  SELECT
    order_id,
    account_manager,
    COUNT(*) OVER(PARTITION BY account_manager) num_in_acct_manager
  FROM
    MODE.dunder_mifflin_paper_sales
)
SELECT
  *
FROM
  state_count sc
  JOIN acct_manager_count amc ON sc.order_id = amc.order_id
WHERE
  num_in_state >= 10 AND num_in_acct_manager >= 70