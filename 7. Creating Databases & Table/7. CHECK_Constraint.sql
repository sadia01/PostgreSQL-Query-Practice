CREATE TABLE employees(
emp_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
birthdate DATE CHECK (birthdate > '1996-01-01'),
hire_date DATE CHECK (hire_date > birthdate ),
salary INTEGER CHECK (salary > 0)
);



INSERT INTO employees(
first_name,
last_name,
birthdate,
hire_date,
salary
)
VALUES
('Sadia',
 'Smith',
 '2000-11-13',
 '2024-01-01',
 '100'
),
('Sam',
 'Smith',
 '2000-10-03',
 '2024-01-01',
 '200'
);

SELECT * FROM employees;
