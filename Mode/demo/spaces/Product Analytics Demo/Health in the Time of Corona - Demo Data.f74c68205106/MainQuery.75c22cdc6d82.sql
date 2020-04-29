SELECT account_name AS "Account Name",
       csm AS "CSM",
       segment AS "Segment",
       arr AS "ARR",
       total_risk_category AS "Total Risk Category",
       account_risk_category AS "Account Risk Category",
       usage_risk_category AS "Usage Risk Category",
       firm_risk_category AS "Firm Risk Category"
FROM johnny_kelley.health_in_the_time_of_corona_demo_raw_data
where CSM in ({{ CSM }})