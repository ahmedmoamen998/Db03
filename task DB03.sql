--TO START:
--Create a new database named "CompanyDB."
create database CompanyDB
use CompanyDB
--Create a schema named "Sales" within the "CompanyDB" database.
create schema sales 
go 
--Create a table named "employees" with columns: employee_id (INT), first_name (VARCHAR), last_name (VARCHAR), and salary (DECIMAL) within the "Sales" schema.
CREATE SEQUENCE i  
    AS INT
    START WITH 1 
    INCREMENT BY 1

create table sales.employees(
employee_id INT DEFAULT(NEXT VALUE FOR i) ,
first_name varchar(30), 
last_name varchar(30),salary DECIMAL(10,2),
) 
--Note: on employee_id use squence NOT identity.

--Alter the "employees" table to add a new column named "hire_date" with the data type DATE.
	alter table sales.employees
	add   hire_date date 
--If you want to Add mock data test use https://www.mockaroo.com
--DATA MANIPULATION Exercises:
--Select all columns from the "employees" table.
select * from sales.employees
--Retrieve only the "first_name" and "last_name" columns from the "employees" table.
select first_name,last_name  from sales.employees
--Retrieve “full name” as a one column from "first_name" and "last_name" columns from the "employees" table.
select first_name+ ' ' +last_name  fullName  from sales.employees
--Show the average salary of all employees.
select AVG(salary) avg_salary from sales.employees
--Select employees whose salary is greater than 50000.
select * from sales.employees where salary>50000 
--Retrieve employees hired in the year 2020.
select *  from sales.employees  where year(hire_date) = 2020
--List employees whose last names start with 'S.'
 select *  from sales.employees where first_name like 's%'
--Display the top 10 highest-paid employees.
 select *  from sales.employees  order by salary desc OFFSET 0 ROWS 
FETCH NEXT 10 ROWS ONLY;


--Find employees with salaries between 40000 and 60000.
 select *  from sales.employees where salary between  40000 and 60000
--Show employees with names containing the substring 'man.'
select  *  from sales.employees where first_name like'%man%'
--Display employees with a NULL value in the "hire_date" column.
select *  from sales.employees where hire_date IS NULL

--Select employees with a salary in the set (40000, 45000, 50000).
select *  from sales.employees where salary in (40000, 45000, 50000)

--Retrieve employees hired between '2020-01-01' and '2021-01-01.'
select *  from sales.employees WHERE hire_date BETWEEN '2020-01-01' AND '2021-01-01';
--List employees with salaries in descending order.
select *  from sales.employees order by salary desc
--Show the first 5 employees ordered by "last_name" in ascending order.
 select *  from sales.employees  order by last_name OFFSET 0 ROWS 
FETCH NEXT 5 ROWS ONLY;
--Display employees with a salary greater than 55000 and hired in 2020.
select *  from sales.employees where salary>55000 and YEAR(hire_date) = 2020
--Select employees whose first name is 'John' or 'Jane'
select *  from sales.employees where first_name in ('John','Jane')
--List employees with a salary less than or equal to 55000 and a hire date after '2022-01-01'
select *  from sales.employees where salary <=55000 and hire_date > '2022-01-01'
--Retrieve employees with a salary greater than the average salary.
SELECT * 
FROM sales.employees 
WHERE salary > (SELECT AVG(salary) FROM sales.employees )
--Display the 3rd to 7th highest-paid employees.
 select *  from sales.employees  order by salary asc  OFFSET 2 ROWS 
FETCH NEXT 7 ROWS ONLY;


--Display employees with a salary that is not NULL.
 select *  from sales.employees where salary IS not NULL

--Show employees with names containing 'e' or 'i' and a salary greater than 45000.
 select *  from sales.employees where first_name like '%e%'or first_name like '%i%'and salary>45000
--List employees hired after '2021-01-01' in alphabetical order.
select *  from sales.employees where hire_date > '2021-01-01' order by first_name asc

--Retrieve employees with a salary greater than 50000 and last name not starting with 'A.'
 select *  from sales.employees where salary >50000 and last_name not like 'A%'