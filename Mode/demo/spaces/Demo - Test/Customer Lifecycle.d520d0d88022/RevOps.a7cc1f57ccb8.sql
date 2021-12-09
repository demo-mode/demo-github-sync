SELECT
  
  mql.mql_id,
  mql.first_contact_date,
  mql.landing_page_id,
  mql.origin,
  cd.won_date,
  cd.business_type,
  cd.business_segment,
  cd.lead_type,
  cd.lead_behaviour_profile,
  cd.has_company,
  cd.average_stock,
  cd.declared_product_catalog_size,
  cd.declared_monthly_revenue
FROM
  tutorial.olist_marketing_qualified_leads_dataset mql
LEFT JOIN
  tutorial.olist_closed_deals_dataset cd
    ON mql.mql_id = cd.mql_id
