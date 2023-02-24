-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/uOXSvk
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE IF EXISTS "Departments";
CREATE TABLE "Departments" (
    dept_no varchar   NOT NULL,
    dept_name varchar   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        dept_no
     )
);

DROP TABLE IF EXISTS "Titles";
CREATE TABLE "Titles" (
    title_id varchar   NOT NULL,
    title varchar   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        title_id
     )
);


DROP TABLE IF EXISTS "Employees";
CREATE TABLE "Employees" (
    emp_no int   NOT NULL,
    emp_title_id varchar   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    sex varchar(1)   NOT NULL,
    hire_date date   NOT NULL,
	FOREIGN KEY(emp_title_id) REFERENCES "Titles" (title_id),
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        emp_no
     )
);


DROP TABLE IF EXISTS "Dept_emp";
CREATE TABLE "Dept_emp" (
    emp_no int   NOT NULL,
    dept_no varchar   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES "Employees" (emp_no),
	FOREIGN KEY (dept_no) REFERENCES "Departments" (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

DROP TABLE IF EXISTS "Dept_manager";
CREATE TABLE "Dept_manager" (
    dept_no varchar   NOT NULL,
    emp_no int   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES "Employees" (emp_no),
	FOREIGN KEY (dept_no) REFERENCES "Departments" (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);


DROP TABLE IF EXISTS "Salaries";
CREATE TABLE "Salaries" (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES "Employees" (emp_no),
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        emp_no
     )
);




