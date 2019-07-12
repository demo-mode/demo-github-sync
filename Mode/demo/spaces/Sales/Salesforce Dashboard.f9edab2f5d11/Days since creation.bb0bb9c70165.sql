
SELECT created_date as Date,
       id AS organization_id,
       industry AS industry,
       extract(day from(CURRENT_DATE -created_date)) as days_since_creation
FROM modeanalytics.salesforce_accounts 
where industry = '{{industry}}'