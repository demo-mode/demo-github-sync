SELECT 
'{{team}}' AS team,
CASE WHEN quarter = '1' THEN '1st'
  WHEN quarter = '2' THEN '2nd'
  WHEN quarter = '3' THEN '3rd'
  WHEN quarter = '4' THEN '4th'
  ELSE 'OT' 
END as quarter,
COUNT(touchdown_id)as touchdowns
FROM benn.nfl_touchdowns
WHERE
  team = '{{team}}'
  GROUP BY 1,2
  ORDER BY 2
  LIMIT 2
  
  {% form %}
  team:
    type: select
    default: SFO
    options: [
                [SFO, SFO],
                [NYG, NYG],
                [OAK, OAK],
                [PIT, PIT]
              ]
  {% endform %}