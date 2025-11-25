SELECT 'redirect' AS component, 'login.sql' AS link
WHERE NOT EXISTS (SELECT 1 FROM Sessions WHERE session_token = sqlpage.cookie('session_token'));

select 
  'shell' as component,
  'FIU Parking' as title,
  'paw' as icon,
  '/' as link,
  JSON('[{"link":"/","title":"Manual Count Form","active":false},{"link":"/reports.sql","title":"Reports","active":false}]') as menu_item,
  TRUE as sidebar,
  'https://www.fiu.edu/_assets/images/favicon.ico' as favicon;

select 'button' as component;
select 'Return' as title,
  'arrow-left' as icon,
  '/reports.sql' as link;
select 'csv' as component,
  'Download report' as title,
  'file-download' as icon,
  'green' as color,
  TRUE as bom,
  'occupancy_report' || to_char(to_timestamp(:from_date,'YYYY-MM-DD'), 'YYYYMMDD' || '-' || to_char(to_timestamp(:to_date, 'YYYY-MM-DD'), 'YYYYMMDD')) as filename;
SELECT t2.garage_name as Garage,
  t1.count_real as Real,
  t1.count_system as System,
  (SELECT t1.count_real - t1.count_system) as Variance,
  to_char((t1.timestamp AT TIME ZONE 'EDT'), 'MM-DD-YYYY HH:MM:SS') as Time
FROM ManualCounts t1 JOIN Garages t2 ON t1.garage_id = t2.garage_id
WHERE timestamp >= to_timestamp(:from_date, 'YYYY-MM-DD') AND 
timestamp <= to_timestamp(:to_date || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS');

select 'table' as component,
  TRUE as small,
  TRUE as sort,
  TRUE as striped_rows;
SELECT t1.count_id AS _sqlpage_id,
  t2.garage_name as Garage,
  t1.count_real as Real,
  t1.count_system as System,
  (SELECT t1.count_real - t1.count_system) as Variance,
/*   (SELECT trunc(abs(t1.count_real::real - t1.count_system) / ((t1.count_real::real + t1.count_system)/2) * 100)) as Percent_Diff, */
  to_char((t1.timestamp AT TIME ZONE 'EDT'), 'MM-DD-YYYY HH:MM:SS') as Time
FROM ManualCounts t1 JOIN Garages t2 ON t1.garage_id = t2.garage_id
WHERE timestamp >= to_timestamp(:from_date, 'YYYY-MM-DD') AND 
timestamp <= to_timestamp(:to_date || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS');
