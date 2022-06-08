/* ##################INSTRUCTIONS TO ENABLE QUERY TO RUN ON DISCOVERY DATABASE ##############################
*
*Because the Mode Public Warehouse runs on a postgreSQL database, we need to make a few changes to the syntax so the query can successfully run on the Discovery Database,
*which is provided through Snowflake.
*
*Please make the following changes
*1. Switch to your Discovery Database connection
*2. Remove the comments around "mode."
*3. Replace "NOW()" with CURRENT_TIMESTAMP

*/

WITH failed_scheduled_query_runs AS (
  SELECT
    r.id AS report_id,
    COUNT(1) AS failed_scheduled_query_runs_rolling_28_day
  FROM
    MODE.ORGANIZATION_USAGE.REPORTS r
    JOIN MODE.ORGANIZATION_USAGE.QUERIES q ON r.id = q.REPORT_ID
    JOIN MODE.ORGANIZATION_USAGE.QUERY_RUNS qr ON q.id = qr.QUERY_ID
  WHERE
    qr.is_scheduled = 'true'
    AND qr.state = 'failed'
    AND qr.STARTED_AT_UTC >= CURRENT_DATE - INTERVAL '28 DAYS'
  GROUP BY
    1
),
views AS (
  SELECT
    r.id AS report_id,
    COUNT(DISTINCT v.VIEWER_ID) AS viewers_rolling_28_day,
    COUNT(1) AS views_rolling_28_day
  FROM
    MODE.ORGANIZATION_USAGE.REPORTS r
    JOIN MODE.ORGANIZATION_USAGE.REPORT_VIEWS v ON v.report_id = r.id
    AND v.VIEWED_AT_UTC >= CURRENT_DATE - INTERVAL '28 DAYS'
  GROUP BY
    1
),
subscribers AS (
  SELECT
    report_id,
    count(EMAIL_SUBSCRIBER_EMAIL) AS email_subscriptions,
    count(SLACK_CHANNEL_ID) AS slack_channels
  FROM
    MODE.ORGANIZATION_USAGE.ACTIVE_REPORT_SUBSCRIBERS
  GROUP BY
    1
),
connections_staging AS (
  SELECT
    r.id AS report_id,
    c.name AS connection_name,
    c.DB_TYPE AS db_type
  FROM
    MODE.ORGANIZATION_USAGE.REPORTS r
    JOIN MODE.ORGANIZATION_USAGE.QUERIES q ON q.report_id = r.id
    AND q.state = 'active'
    JOIN MODE.ORGANIZATION_USAGE.CONNECTIONS c ON c.name = q.CONNECTION_NAME
),
connections AS (
  SELECT
    c.report_id,
    LISTAGG(DISTINCT c.connection_name, ', ') WITHIN GROUP (
      ORDER BY
        c.connection_name
    ) AS connections,
    LISTAGG(DISTINCT C.db_type, ', ') WITHIN GROUP (
      ORDER BY
        c.db_type
    ) AS connection_types
  FROM
    connections_staging c
  GROUP BY
    1
),
report_query_count AS (
  SELECT
    REPORT_ID AS token,
    count(1) AS queries
  FROM
    MODE.ORGANIZATION_USAGE.QUERIES
  GROUP BY
    1
),
report_stats AS (
  SELECT
    r.id AS report_id,
    r.NAME AS name,
    r.CREATED_AT_UTC AS created_at,
    r.CREATOR_EMAIL AS creator,
    r.url AS url,
    rqc.queries
  FROM
    MODE.ORGANIZATION_USAGE.REPORTS r
    JOIN report_query_count rqc ON r.id = rqc.token
),
reports AS (
  SELECT
    rep.id AS report_token,
    LISTAGG(rs.id, ',') AS schedule_tokens,
    r.name AS report_name,
    r.url AS report_url,
    ds.connections AS connected_data_sources_name,
    ds.connection_types AS connected_databases_type,
    r.creator AS report_creator_username,
    r.created_at AS report_created_at_utc,
    r.queries AS query_count,
    COALESCE(v.viewers_rolling_28_day, 0) AS viewers_rolling_28_day,
    COALESCE(v.views_rolling_28_day, 0) AS views_rolling_28_day,
    COALESCE(es.email_subscriptions, 0) AS email_subscriptions,
    COALESCE(es.slack_channels, 0) AS slack_subscriptions,
    MIN(rs.created_at) AS first_schedule_created_at_utc,
    MAX(rs.created_at) AS last_schedule_created_at_utc,
    COUNT(rs.id) AS active_schedules,
    MAX(r.queries) * SUM(
      CASE
        WHEN rs.cadence = '15 minutes' THEN 2880
        WHEN rs.cadence = '30 minutes' THEN 1440
        WHEN rs.cadence = 'hourly' THEN 720
        WHEN rs.cadence = 'daily' THEN 30
        WHEN rs.cadence = 'weekly' THEN 4
        WHEN rs.cadence = 'monthly' THEN 1
      END
    ) AS approx_current_scheduled_query_runs_per_month,
    COALESCE(f.failed_scheduled_query_runs_rolling_28_day, 0) AS failed_scheduled_query_runs_rolling_28_day
  FROM
    MODE.ORGANIZATION_USAGE.REPORTS rep
    JOIN report_stats r ON r.report_id = rep.id
    JOIN MODE.ORGANIZATION_USAGE.REPORT_SCHEDULES rs ON rs.report_id = r.report_id
    AND rs.deleted_at IS NULL
    LEFT JOIN connections ds ON ds.report_id = rep.id
    LEFT JOIN failed_scheduled_query_runs f ON f.report_id = r.report_id
    LEFT JOIN views v ON v.report_id = r.report_id
    LEFT JOIN subscribers es ON es.report_id = r.report_id
  GROUP BY
    1,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    18
)
SELECT
  *, CASE
    WHEN r.failed_scheduled_query_runs_rolling_28_day > 50 THEN TRUE
    WHEN r.approx_current_scheduled_query_runs_per_month > views_rolling_28_day * 100 THEN TRUE
    ELSE FALSE   END AS strong_cleanup_candidate
FROM
  reports r 
  where email_subscriptions > 0 OR slack_subscriptions > 0
  order by 19 desc, 17 desc
