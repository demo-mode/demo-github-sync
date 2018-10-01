 select user_id
    , occurred_at
    , EXTRACT('year' from occurred_at) as occurred_year
    , EXTRACT('month' from occurred_at) as occurred_month
    , EXTRACT('day' from occurred_at) as occurred_day
    , CASE WHEN EXTRACT('dow' from occurred_at) in (0,6) THEN 'Weekend' ELSE 'Weekday' END as occurred_weekday
    , INITCAP(REPLACE(event_type, '_', ' ')) as event_type
    , INITCAP(REPLACE(event_name, '_', ' ')) as event_name
    , INITCAP(retention_events.device) as device
    , system_tags.manufacturer as device_manufacturer
    , system_tags.os as device_os
    , system_tags.device_form_factor
    , retention_events.location as location_country
    , all_country_data2.region as location_region
    , all_country_data2.sub_region as location_sub_region

  from modeanalytics.retention_events
  left join modeanalytics.system_tags on system_tags.device=retention_events.device
  left join modeanalytics.all_country_data2 on all_country_data2.name = retention_events.location