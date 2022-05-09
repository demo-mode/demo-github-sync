SELECT
  DISTINCT(account_manager) AS mgr_list
FROM
  MODE.dunder_mifflin_paper_sales

{%form%}
acct_mgr:
  type: multiselect
  default: all
  options:
    labels: mgr_list
    values: mgr_list
{%endform%}