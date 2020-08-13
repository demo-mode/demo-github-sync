select '{{Economic_Outlook}}' as Economic_Outlook,
'{{Industry_Competition}}' as Industry_Competition

{% form %}

Economic_Outlook:
  type: select
  default: 'standard'
  options: ['depression', 'poor', 'standard', 'good', 'amazing' ]
  description: What is the current economic outlook?
  
Industry_Competition:
  type: select
  default: 'standard'
  options: ['high', 'standard', 'low']
  description: What degree of compeition is there in this industry? 


{% endform %}