--1--
INSERT INTO account(user_name,password,email,created_on)
VALUES
('Jose','password','jose@gmail.com',CURRENT_TIMESTAMP);

SELECT * FROM account;

--2--
INSERT INTO job(job_name)
VALUES
('SQA'),('Tester');

SELECT * FROM job;

--3--
INSERT INTO account_job(user_id,job_id,hire_date)
VALUES
(1,1,CURRENT_TIMESTAMP)

SELECT * FROM account_job;