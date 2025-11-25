select 'authentication' as component,
  '/login.sql' as link,
  (SELECT password_hash FROM Users WHERE username = :username) as password_hash,
  :password as password;

INSERT INTO sessions(user_id, ip_address, session_token)
VALUES ((SELECT user_id FROM Users WHERE username = :username), sqlpage.client_ip()::inet, sqlpage.random_string(32))
  returning 'cookie' as component,
  'session_token' as name,
  session_token as value,
  (SELECT extract(EPOCH FROM INTERVAL '1 month')) as max_age,
  FALSE as secure;

select 'cookie' as component,
  'username' as name,
  :username as value,
  (SELECT extract(EPOCH FROM INTERVAL '1 month')) as max_age,
  FALSE as secure;

select 'redirect' as component,
  '/' as link;
