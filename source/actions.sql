DELETE FROM ManualCounts 
WHERE count_id = $delete_id::int
RETURNING 'redirect' AS component, 'index.sql' AS link;

INSERT INTO ManualCounts(garage_id, count_real, count_system, timestamp) VALUES (:garage_id::int, :count_real::int, :count_system::int, CURRENT_TIMESTAMP)
RETURNING 'redirect' AS component, 'index.sql' AS link;
