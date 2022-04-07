-- Returns first 100 rows from tutorial.kag_conversion_data
SELECT
  c.xyz_campaign_id,
  c.fb_campaign_id,
  c.age,
  c.gender,
  SUM(c.impressions) as awareness,
  SUM(c.interest) as interest,
  SUM(c.clicks) as clicks,
  SUM(c.total_conversion) as conversions,
  SUM(c.approved_conversion) as approved_conversions,
  SUM(c.spent) as spent
FROM
  tutorial.kag_conversion_data c
GROUP BY
  1,2,3,4