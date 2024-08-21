--1--
DELETE FROM account_job
WHERE job_id = 1
RETURNING job_id,user_id,hire_date;


--2--
INSERT INTO job(job_name)
VALUES ('Administrator');

SELECT * FROM job;

DELETE FROM job
WHERE job_name = 'Administrator'
RETURNING job_id,job_name;
