SELECT 'redirect' AS component, 'login.sql' AS link
WHERE NOT EXISTS (SELECT 1 FROM Sessions WHERE session_token = sqlpage.cookie('session_token'));

DELETE FROM ManualCounts 
WHERE $action = 'delete' AND count_id = $delete_id::int
RETURNING 'redirect' AS component, 'index.sql' AS link;

INSERT INTO ManualCounts(garage_id, count_real, count_system, timestamp)
SELECT 
    :garage_id::int, 
    :count_real::int,
    :count_system::int,
    CURRENT_TIMESTAMP
WHERE 
    $action = 'insert'
RETURNING 'redirect' AS component, 'index.sql' AS link;
