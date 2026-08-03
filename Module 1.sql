-- Module 1 – Data Warehouse & Employee Analytics 

create database project;
use project;
CREATE TABLE department(department_id INT PRIMARY KEY, department_name VARCHAR(100));
INSERT INTO department VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance'),
(4,'Sales'),
(5,'Marketing');
drop table employee;
CREATE TABLE employee (emp_id INT,emp_name VARCHAR(50),department VARCHAR(50),department_id INT,salary INT,hire_date DATE,load_date DATE);
INSERT INTO employee VALUES
(101,'Ram','HR',1,50000,'2022-01-10','2024-07-01'),
(102,'Ravi','IT',2,60000,'2021-03-15','2024-07-01'),
(103,'Mohan','Finance',3,55000,'2020-06-20','2024-07-01'),
(104,'Priya','Sales',4,45000,'2023-02-12','2024-07-01'),
(105,'Divya','Marketing',5,65000,'2021-11-25','2024-07-01'),
(106,'Ram','HR',1,52000,'2022-04-18','2024-07-02'),
(107,'John','IT',2,70000,'2020-08-14','2024-07-02'),
(108,'David','Marketing',5,48000,'2023-05-10','2024-07-02'),
(109,'Anu',NULL,NULL,40000,'2022-09-21','2024-07-02'),
(110,'Kumar','Finance',3,62000,'2021-07-11','2024-07-03'),
(111,'Ravi','IT',2,61000,'2021-03-15','2024-07-03'),
(112,'Mohan','Finance',3,58000,'2020-06-20','2024-07-03'),
(113,'Surya','Unknown',99,53000,'2022-10-01','2024-07-03'),
(114,'Meena','Sales',4,47000,'2023-01-19','2024-07-04'),
(115,'Ajay','HR',1,50000,'2022-12-15','2024-07-04'),
(116,'Nisha','Marketing',5,68000,'2020-04-28','2024-07-04'),
(117,'Vijay','IT',2,71000,'2019-09-09','2024-07-05'),
(118,'Kiran','Finance',3,72000,'2018-11-30','2024-07-05'),
(119,'Priya',NULL,25,55000,'2023-07-17','2024-07-05'),
(120,'Ram','HR',1,50000,'2022-01-10','2024-07-06'),
(121,'Arun','Sales',4,46000,'2021-05-14','2024-07-06'),
(122,'Sathish','Marketing',5,64000,'2020-10-05','2024-07-06'),
(123,'Hari','IT',2,59000,'2022-08-22','2024-07-07'),
(124,'Ramya','Finance',3,61000,'2021-09-13','2024-07-07'),
(125,'Deepa','HR',1,54000,'2020-02-18','2024-07-07'),
(126,'Ravi','IT',2,60000,'2021-03-15','2024-07-08'),
(127,'Mohan','Finance',3,NULL,'2020-06-20','2024-07-08');

/* Task 1 – Employee Data Profiling The Data Engineering team needs a summary of employee records loaded into the Data Warehouse. 
Display: • Department • Total Employees • Average Salary • Highest Salary • Lowest Salary Sort by Average Salary in descending order. */

select department, count(*) as total_employees, avg(salary) as average_salary, max(salary) as highest_salary, min(salary) as lowest_salary 
from employee group by department order by avg(salary);

/* Task 2 – Department Salary Analysis Find departments whose total salary is greater than the company average department salary. 
Display: • Department • Total Salary */

with cte as(
select department, sum(salary) as total_salary from employee group by department)
select department , total_salary from cte where total_salary > (select avg(total_salary) from cte);

/*Task 3 – Salary Validation Identify employees whose salary is higher than the average salary of their department. 
Display: • Employee Name • Department • Salary • Department Average */

with cte as(
select department, avg(salary) as dep_avg from employee group by department)
select e.emp_name,e.department,e.salary,d.dep_avg from employee e join cte d on e.department = d.department where e.salary > d.dep_avg;

/* Task 4 – Department Ranking Rank departments based on total salary expenditure.
 Display: • Department • Total Salary • Rank */
 
with cte as(
select department, sum(salary) as total_salary from employee group by department)
select department,total_salary, rank() over(order by total_salary desc) as ranks from cte;

/* Task 5 – Duplicate Employee Detection Find duplicate Employee IDs generated during ETL loading. */

select emp_id,count(*) as duplicate_count from employee group by emp_id having count(*) > 1;

/* Task 6 – Missing Department Mapping Display employees whose Department_ID has no matching record in the Department table. */

select e.emp_id,e.emp_name,e.department,e.department_id from employee e left join department d on e.department_id = d.department_id 
where e.department_id is null;

/* Task 7 – Latest Employee Record Each employee may have multiple records due to historical loads.
 Display only the latest record for every employee. */
 
  with cte as (
  select emp_id,emp_name,load_date,row_number() over(partition by emp_id order by load_date desc) as rn from employee )
  select emp_id,emp_name,load_date from cte where rn=1;
  
  /* Task 8 – Employee Growth Analysis Calculate the running total of employees hired month-wise. */
  
   with cte as(
   select date_format(hire_date,'%Y-%m') as hire_month , count(*) as employee_hired from employee group by date_format(hire_date,'%Y-%m') )
   select hire_month,employee_hired, sum(employee_hired) over(order by hire_month) as running_total from cte;
   
/* Task 9 – Department-wise Top 3 Salaries Display the top three highest-paid employees in every department. */

with cte as
(select emp_id,emp_name,department,salary,dense_rank() over(partition by department order by salary desc) as rnk from employee)
select emp_id,emp_name,department,salary from cte where rnk <=3;

/* Task 10 – Employee Summary View Create a View that displays active employee details along with department information. */

create view active_employee as
select e.emp_id,e.emp_name,e.hire_date,d.department_name from employee e join department d on e.department_id = d.department_id
where year(hire_date) = '2023';

select * from active_employee;