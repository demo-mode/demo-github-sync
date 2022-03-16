
SELECT
  CASE
    WHEN account_manager = 'Dwight Schrute' THEN 'Open Tickets'
    WHEN account_manager = 'Angela Martin' THEN 'Sales KPIs'
    WHEN account_manager = 'Ryan Howard' THEN 'Marketing Pipeline'
    WHEN account_manager = 'Andy Bernard' THEN 'Product Roadmap'
    WHEN account_manager = 'Erin Hannon' THEN 'Outbound Call Volume'
    ELSE 'null'
  END AS views,
  quantity
FROM
  tutorial.dunder_mifflin_paper_sales
