SELECT ci.company_category_code,
       ci.company_city,
       ci.company_country_code,
       ci.company_name,
       ci.company_permalink,
       ci.company_region,
       ci.company_state_code,
       ci.funded_at,
       ci.funded_month,
       ci.funded_quarter,
       ci.funded_year,
       ci.funding_round_type,
       ci.id,
       ci.investor_category_code,
       ci.investor_city,
       ci.investor_country_code,
       ci.investor_name,
       ci.investor_permalink,
       ci.investor_region,
       ci.investor_state_code,
       ci.raised_amount_usd
       
FROM tutorial.crunchbase_investments ci 
WHERE funded_year >= '2002'