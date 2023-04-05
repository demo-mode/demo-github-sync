SELECT *
  FROM tutorial.crunchbase_companies_clean_date
  WHERE country_code = '{{ country_code }}'
 ORDER BY founded_at_clean
 
 
 {% form %}

country_code:
    type: text
    default: USA

{% endform %}