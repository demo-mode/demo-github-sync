    SELECT DISTINCT experiment_name AS experiment
      FROM modeanalytics.demo_experiment_results
     ORDER BY 1
    

{% form %}
 
experiment:
  type: select
  default: CTA Button
  options:
    values: experiment
    labels: experiment
    
step:
  type: select
  default: Signup
  options: [Signup,Trial,Conversion]
    
{% endform %}