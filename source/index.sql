select 
  'shell' as component,
  'FIU Parking & Transportation' as title,
  'paw' as icon,
  '/' as link,
  JSON('{"title":"Manual Count Form","active":true}') as menu_item;

select 'form' as component,
  'Occupancy Form' as title,
  'Enter Count' as validate,
  'actions.sql' as action;

select 'garage_id' as name, 
  'select' as type, 
  'Garage or Lot' as label,
  true as required,
  'Select a garage...' as empty_option,
  jsonb_agg(jsonb_build_object('label', garage_name, 'value', garage_id)) AS options FROM Garages;
select 'count_real' as name, 
  'Number of vehicles counted' as label,
  'number' as type,
  true as required;
select 'count_system' as name, 
  'Number of vehicles in Security Desk' as label,
  'number' as type,
  true as required;


select 'table' as component,
  true as sort,
  true as search,
  CURRENT_DATE as initial_search_value,
  '/actions.sql?delete_id={id}' as delete_url;
select t1.count_id as _sqlpage_id,
  t2.garage_name as Garage,
  t1.count_real as Real,
  t1.count_system as System,
  -- to_char(timezone('America/New_York', t1.timestamp), 'MM-DD-YYYY HH:MM:SS') as Time
  timezone('America/New_York', t1.timestamp) as Time
from ManualCounts t1 JOIN Garages t2 ON t1.garage_id = t2.garage_id;
