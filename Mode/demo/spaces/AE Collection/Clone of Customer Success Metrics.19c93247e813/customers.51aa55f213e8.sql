SELECT 
d.csm as "Account Owner",
d.account_name as "Account Name",
d.arr as "ARR",
d.active_users as "Active Users",
d.licenses as "Licenses Purchases",
d.mau as "MAU",
d.seat_adoption as "Seat Adoption",
d.dau_mau as "DAU/MAU",
d.active_growth_30_d_pct as "Active Growth 30 Day %",
d.segment as "Segment",
d.days_in_onboarding as "Days in Onboarding",
d.pct_feature_usage as "Feature Usage %",
d.account_hq_location as "Region",
d.onboard_date as "Onboard Date",
d.churn_date as "Churn Date",
split_part(csm, ' ', 1) as "First Name",
CASE WHEN seat_adoption >= .80 THEN 'Yes' ELSE 'No' END as "Hit Seat Adoption"
FROM asha_hill.product_adoption_fake_demo_data d


