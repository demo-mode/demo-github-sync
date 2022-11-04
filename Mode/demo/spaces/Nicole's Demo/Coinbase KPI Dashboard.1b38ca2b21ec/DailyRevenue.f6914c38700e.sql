SELECT
  *,
  CASE
    WHEN time_id = CURRENT_DATE THEN 'Current'
    WHEN time_id < CURRENT_DATE THEN 'Historic'
    ELSE 'Future'
  END AS time_category
FROM
  roberto_salcido899.solutionsdemodailyrevenue

{% form %}

segment:
  label: "Select a Segment"
  type: multiselect
  default: all
  options:
    labels: segment
    values: segment

City:
  type: text 

{% endform %}