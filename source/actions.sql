DELETE FROM ManualCounts 
WHERE count_id = $delete_id 
RETURNING 'redirect' AS component, 'index.sql' AS link;

INSERT INTO ManualCounts(garage_id, count, date, time) VALUES (:garage_id, :count, date(), time())
RETURNING 'redirect' AS component, 'index.sql' AS link;
