
SELECT
  churn.customer_id,
  churn.gender,
  churn.senior_citizen,
  churn.partner,
  churn.dependents,
  churn.tenure,
  churn.phone_service,
  churn.multiple_lines,
  churn.internet_service,
  churn.online_security,
  churn.online_backup,
  churn.device_protection,
  churn.tech_support,
  churn.streaming_tv,
  churn.contract,
  churn.paperless_billing,
  churn.payment_method,
  churn.monthly_charges,
  REPLACE(churn.total_charges, ',', '')::float as total_charges,
  churn.churn
FROM
  tutorial.wa_fn_usec_telco_customer_churn_wa_fn_usec_telco_customer_churn churn
