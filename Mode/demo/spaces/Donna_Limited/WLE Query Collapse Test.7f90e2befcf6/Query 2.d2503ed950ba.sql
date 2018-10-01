SELECT
  *
FROM
  demo.monthly_sales
WHERE
  sales_rep LIKE '{{salesrep}}%'