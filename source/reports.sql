SELECT 'redirect' AS component, 'login.sql' AS link
WHERE NOT EXISTS (SELECT 1 FROM Sessions WHERE session_token = sqlpage.cookie('session_token'));

select 
  'shell' as component,
  'FIU Parking' as title,
  'paw' as icon,
  '/' as link,
  JSON('[{"link":"/","title":"Manual Count Form","active":false},{"link":"/reports.sql","title":"Reports","active":true}]') as menu_item,
  TRUE as sidebar,
  'https://www.fiu.edu/_assets/images/favicon.ico' as favicon;

select
  'form' as component,
  'Generate Report' as title,
  'Create report' as validate,
  '/report.sql' as action;
select
  'from_date' as name,
  'From date' as label,
  'date' as type,
  (select to_char(date_trunc('week', CURRENT_TIMESTAMP AT TIME ZONE 'EDT'), 'YYYY-MM-DD')) as value;
select
  'to_date' as name,
  'To date' as label,
  'date' as type,
  (select to_char(date_trunc('week', CURRENT_TIMESTAMP AT TIME ZONE 'EDT') + INTERVAL '5 days', 'YYYY-MM-DD')) as value;
