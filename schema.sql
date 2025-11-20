CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR2(50) UNIQUE NOT NULL
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR2(50) NOT NULL,
    salary NUMBER(10,2) CHECK (salary > 0),
    department INT,
    hire_date DATE DEFAULT SYSDATE,
    FOREIGN KEY (department) REFERENCES Departments(dept_id)
);

CREATE INDEX idx_salary ON Employees(salary);
