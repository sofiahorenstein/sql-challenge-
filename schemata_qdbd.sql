-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Qj1sMo
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "departments_ID" INTEGER   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "departments_ID"
     )
);

CREATE TABLE "employees" (
    "employees_ID" INTEGER   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "birth_date" VARCHAR   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employees_ID"
     )
);

CREATE TABLE "dept_emp" (
    "departments_ID" INTEGER   NOT NULL,
    "employees_ID" INTEGER   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL
);

CREATE TABLE "dept_manager" (
    "departments_ID" INTEGER   NOT NULL,
    "employees_ID" INTEGER   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL
);

CREATE TABLE "salaries" (
    "employees_ID" INTEGER   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL
);

CREATE TABLE "titles" (
    "employees_ID" INTEGER   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_departments_ID" FOREIGN KEY("departments_ID")
REFERENCES "departments" ("departments_ID");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_employees_ID" FOREIGN KEY("employees_ID")
REFERENCES "employees" ("employees_ID");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_departments_ID" FOREIGN KEY("departments_ID")
REFERENCES "departments" ("departments_ID");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_employees_ID" FOREIGN KEY("employees_ID")
REFERENCES "employees" ("employees_ID");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_employees_ID" FOREIGN KEY("employees_ID")
REFERENCES "employees" ("employees_ID");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_employees_ID" FOREIGN KEY("employees_ID")
REFERENCES "employees" ("employees_ID");