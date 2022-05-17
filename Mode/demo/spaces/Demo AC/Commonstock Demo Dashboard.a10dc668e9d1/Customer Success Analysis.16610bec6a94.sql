SELECT * FROM tutorial.dunder_mifflin_paper_sales

{% form %}

Country:
  type: select
  default: Northeast
  options: [[Northeast,Northeast],
            [Midwest,Midwest],
            [Southeast,Southeast],
            [West,West],
            [All,All]]

start_date:
  type: date
  default: '2022-03-14'

end_date:
  type: date
  default: '2022-03-14'


{% endform %}