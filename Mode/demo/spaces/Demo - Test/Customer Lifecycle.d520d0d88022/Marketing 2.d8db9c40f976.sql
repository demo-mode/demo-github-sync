
SELECT
  CASE
    WHEN STAGE = 'awareness' THEN 1
    WHEN STAGE = 'interest' THEN 2
    WHEN STAGE = 'clicks' THEN 3
    WHEN STAGE = 'conversions' THEN 4
    WHEN STAGE = 'approved conversions' THEN 5
    ELSE 6
  END as rank,
  *
FROM
  (
    SELECT
      c.xyz_campaign_id,
      c.fb_campaign_id,
      c.age,
      c.gender,
      'awareness' AS stage,
      SUM(c.impressions) AS counts
    FROM
      tutorial.kag_conversion_data c
    GROUP BY
      1,2,3,4,5
      
    UNION

  SELECT
      c.xyz_campaign_id,
      c.fb_campaign_id,
      c.age,
      c.gender,
      'interest' AS stage,
      SUM(c.interest) AS counts
    FROM
      tutorial.kag_conversion_data c
    GROUP BY
      1,2,3,4,5

    UNION

    SELECT
      c.xyz_campaign_id,
      c.fb_campaign_id,
      c.age,
      c.gender,
      'clicks' AS stage,
      SUM(c.clicks) AS counts
    FROM
      tutorial.kag_conversion_data c
    GROUP BY
      1,2,3,4,5

    UNION

    SELECT
      c.xyz_campaign_id,
      c.fb_campaign_id,
      c.age,
      c.gender,
      'conversions' AS stage,
      SUM(c.total_conversion) AS counts
    FROM
      tutorial.kag_conversion_data c
    GROUP BY
      1,2,3,4,5
      
    UNION

    SELECT
      c.xyz_campaign_id,
      c.fb_campaign_id,
      c.age,
      c.gender,
      'approved conversions' AS stage,
      SUM(c.approved_conversion) AS counts
    FROM
      tutorial.kag_conversion_data c
    GROUP BY
      1,2,3,4,5
  ) subquery
  
ORDER BY
  CASE
    WHEN STAGE = 'awareness' THEN 1
    WHEN STAGE = 'interest' THEN 2
    WHEN STAGE = 'clicks' THEN 3
    WHEN STAGE = 'conversions' THEN 4
    WHEN STAGE = 'approved conversions' THEN 5
    ELSE 6
  END ASC

