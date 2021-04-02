/* NOTE: When running this query against your Discovery Database, remove the comment blocks around 'mode.' for each table reference. */

WITH
  /*Generates a date spine using PostgreSQL syntax. The result is a column of dates, incremented by day, ranging from 90 days priort to March 3 2021 - March 3 2021*/
  date_spine AS (
    SELECT generate_series(
             (date '2021-03-03' - INTERVAL '90 DAY')::timestamp,
             (date '2021-03-03')::timestamp,
             interval '1 day'
           ) as day
  ),

/*In Snowflake use the below CTE to generate the date spine. Comment out the above PostgreSQL syntax
  date_spine (date_rec) as (
    select to_date([[START_DATE]])
    union all
    select to_date(dateadd(day, 1, date_rec)) --or week, month, week, hour, minute instead of day
    from  date_spine
    where  date_rec < [[END_DATE]]
  )*/
  
  report_views AS (
    SELECT s.day,
           COUNT(DISTINCT rv.viewer_id) as report_viewers,
           COUNT(rv.report_id) as report_views,
           COUNT(DISTINCT rv.report_id) AS reports_viewed
      FROM date_spine s
      LEFT JOIN /*mode.*/organization_usage.report_views rv
        ON rv.viewed_at_utc >= s.day - INTERVAL '6 days'
       AND rv.viewed_at_utc <= s.day
      JOIN /*mode.*/organization_usage.users u
        ON u.id = rv.viewer_id
     GROUP BY 1
  ),

  reports AS (
    SELECT s.day,
           COUNT(DISTINCT r.creator_id) as report_creators,
           COUNT(r.id) AS reports_created
      FROM date_spine s
      LEFT JOIN /*mode.*/organization_usage.reports r
        ON r.created_at_utc >= s.day - INTERVAL '6 days'
       AND r.created_at_utc <= s.day
     GROUP BY 1
  ),
  
  query_runs AS (
    SELECT s.day,
           COUNT(qr.id) AS query_runs,
           COUNT(DISTINCT qr.runner_id) AS query_runners,
           COUNT(CASE WHEN qr.is_scheduled = TRUE THEN qr.query_id ELSE NULL END) AS scheduled_query_runs,
           COUNT(CASE WHEN qr.is_scheduled = FALSE THEN qr.query_id ELSE NULL END) AS unscheduled_query_runs
      FROM date_spine s
      LEFT JOIN /*mode.*/organization_usage.query_runs qr
        ON qr.started_at_utc >= s.day - INTERVAL '6 days'
       AND qr.started_at_utc <= s.day  
     GROUP BY 1
  ),

  visualizations AS (
    SELECT s.day,
           COUNT(v.id) AS visualizations_created,
           COUNT(DISTINCT v.creator_id) AS visualization_creators,
           COUNT(DISTINCT CASE WHEN v.is_saved_exploration = TRUE THEN v.creator_id ELSE NULL END) AS exploration_creators,
           COUNT(CASE WHEN v.is_saved_exploration = TRUE THEN v.id ELSE NULL END) AS explorations_created
      FROM date_spine s
      LEFT JOIN /*mode.*/organization_usage.visualizations v
        ON v.created_at_utc >= s.day - INTERVAL '6 days'
       AND v.created_at_utc <= s.day  
     GROUP BY 1
  )
  
    SELECT rv.day,
          COALESCE(rv.report_views,0) AS report_views_rolling_7_days,
          COALESCE(rv.report_viewers,0) AS report_viewers_rolling_7_days,
          COALESCE(reports_viewed,0) AS reports_viewed_rolling_7_days,
          COALESCE(r.reports_created,0) AS reports_created_rolling_7_days,
          COALESCE(r.report_creators) AS report_creators_rolling_7_days,
          COALESCE(qr.query_runs,0) AS query_runs_rolling_7_days,
          COALESCE(qr.query_runners,0) AS query_runners_rolling_7_days,
          COALESCE(qr.scheduled_query_runs,0) AS scheduled_query_runs_rolling_7_days,
          COALESCE(qr.unscheduled_query_runs,0) AS unscheduled_query_runs_rolling_7_days,
          COALESCE(v.visualizations_created,0) AS visualizations_created_rolling_7_days,
          COALESCE(v.exploration_creators) AS exploration_creators_rolling_7_days,
          COALESCE(v.explorations_created,0) AS explorations_created_rolling_7_days
     FROM report_views rv
     JOIN reports r
       ON r.day = rv.day
     JOIN query_runs qr
       ON qr.day = rv.day
     JOIN visualizations v
       ON v.day = rv.day
     WHERE rv.day > '2021-03-03'::timestamp - INTERVAL '85 DAY'
     ORDER BY 1
