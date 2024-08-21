UPDATE account 
SET last_login = CURRENT_TIMESTAMP;
SELECT * FROM account;

UPDATE account
SET last_login = created_on;
SELECT * FROM account;


--UPDATE JOIN--
UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id;
SELECT * FROM account_job;
SELECT * FROM account;


UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email,created_on,last_login;