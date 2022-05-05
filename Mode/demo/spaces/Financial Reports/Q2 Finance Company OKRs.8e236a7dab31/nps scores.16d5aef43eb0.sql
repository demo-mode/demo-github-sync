SELECT d.csm as "Account Owner",
       d.account_name as "Account Name", 
       d.account_id as "Account Id",
       n.email as "Email",
       d.account_hq_location as "Region",
       d.days_in_onboarding as "Days in Onboarding",
       n.date_submitted as "Date Submitted",
       d.segment as "Segment",
       n.score as "NPS",
       n.type as "Score Category"
       
FROM novaksam.webinar_nps2 n 
JOIN asha_hill.product_adoption_fake_demo_data d 
ON d.account_name = n.organization 
ORDER BY 6 DESC 

