SELECT
  DISTINCT(status) as status_list
FROM
  MODE.dunder_mifflin_paper_sales


{%form%}
order_status:
  type: multiselect
  default: all
  options:
    labels: status_list
    values: status_list
{%endform%}

