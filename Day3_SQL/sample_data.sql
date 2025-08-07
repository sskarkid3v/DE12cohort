CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary INT CHECK (salary > 0),
    age INT,
    dept_id INT,
    hire_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


INSERT INTO departments VALUES
(1, 'Engineering'),
(2, 'HR'),
(3, 'Sales');

INSERT INTO employees VALUES
(101, 'Alice', 70000, 30, 1, '2022-01-10'),
(102, 'Bob', 50000, 24, 2, '2021-07-15'),
(103, 'Charlie', 60000, 35, 1, '2020-03-20'),
(104, 'Diana', 45000, 29, 3, '2023-02-05'),
(105, 'Eve', 80000, 40, 1, '2019-08-01');

INSERT INTO employees values
(107, 'Sharon', 80000, NULL, 1, '2019-08-01');


INSERT INTO departments values
(5, 'Diana')

INSERT INTO employees values
(108, 'Frank', 80000, 50000, NULL, '2019-08-01');

