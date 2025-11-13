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
  json_group_array(json_object('label', garage, 'value', garage_id)) as options FROM Garages;
select 'count' as name, 
  'Number of vehicles' as label,
  'number' as type,
  true as required;

select 'table' as component,
  true as sort,
  true as search,
  date() as initial_search_value,
  '/actions.sql?delete_id={id}' as delete_url;
select t1.count_id as _sqlpage_id,
  t2.garage as Garage,
  t1.count as Count,
  t1.date as Date,
  t1.time as Time
from ManualCounts t1 JOIN Garages t2 ON t1.garage_id = t2.garage_id;
