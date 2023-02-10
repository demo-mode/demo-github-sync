/* This query uses a demo database in the Mode Public Warehouse. 
 It should return all of the sales assosciated with Dwight, Anglea, Ryan & Meredith
 It should also return all of the sales shipped to MT, HI, NY, AL, ME & WV
 For order_ids where the account manager has TOO FEW SALES, the account manager will not be returned
 Similarly, for order_ids where shipping_state has TOO FEW SALES, the shipping state will not be returned
 
 */
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
  sc.order_id order_id,
  CASE
    WHEN num_in_acct_manager >= {{min_account_manager_sales}} THEN amc.account_manager
    ELSE ''
  END AS account_manager,
  CASE
    WHEN num_in_state >= {{min_state_sales}} THEN sc.shipping_state
    ELSE ''
  END AS shipping_state
FROM
  state_count sc
  INNER JOIN acct_manager_count amc ON sc.order_id = amc.order_id
WHERE
  num_in_state >= {{min_state_sales}}
  OR num_in_acct_manager >= {{min_account_manager_sales}}
  

{% form %}

min_account_manager_sales:
  type: text
  default: 70

min_state_sales:
  type: text
  default: 40


{% endform %}