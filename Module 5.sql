create database employee_sales_db;
use employee_sales_db;
create table department (department_id int primary key,department_name varchar(100));
insert into department (department_id, department_name) values(1, 'it'),(2, 'hr'),(3, 'finance'),(4, 'sales'),(5, 'marketing');

create table employee (employee_id int primary key,employee_name varchar(100),department_id int,salary decimal(10,2),
hire_date date,foreign key (department_id) references department(department_id));
insert into employee (employee_id, employee_name, department_id, salary, hire_date) values(101, 'arun', 1, 65000.00, '2022-01-10'),
(102, 'bala', 2, 55000.00, '2022-03-15'),(103, 'chitra', 3, 72000.00, '2021-06-20'),(104, 'dinesh', 4, 60000.00, '2023-02-12'),
(105, 'elango', 5, 58000.00, '2023-05-18'),(106, 'fathima', 1, 78000.00, '2020-08-25'),
(107, 'ganesh', 2, 52000.00, '2024-01-05'),(108, 'hari', 3, 68000.00, '2022-11-30'),(109, 'indu', 4, 62000.00, '2023-07-14'),
(110, 'jaya', 5, 59000.00, '2024-02-20');

create table employee_history (employee_id int,employee_name varchar(100),department_id int,salary decimal(10,2),effective_date date,
foreign key (employee_id) references employee(employee_id),foreign key (department_id) references department(department_id));
insert into employee_history (employee_id, employee_name, department_id, salary, effective_date) values
(101, 'arun', 1, 55000.00, '2022-01-10'),(101, 'arun', 1, 60000.00, '2023-01-10'),(101, 'arun', 1, 65000.00, '2024-01-10'),
(102, 'bala', 2, 48000.00, '2022-03-15'),(102, 'bala', 2, 55000.00, '2024-03-15'),(103, 'chitra', 3, 65000.00, '2021-06-20'),
(103, 'chitra', 3, 72000.00, '2023-06-20'),(104, 'dinesh', 4, 52000.00, '2023-02-12'),(104, 'dinesh', 4, 60000.00, '2024-02-12'),
(105, 'elango', 5, 50000.00, '2023-05-18'),(105, 'elango', 5, 58000.00, '2024-05-18'),(106, 'fathima', 1, 68000.00, '2020-08-25'),(106, 'fathima', 1, 78000.00, '2023-08-25'),
(107, 'ganesh', 2, 47000.00, '2024-01-05'),(107, 'ganesh', 2, 52000.00, '2025-01-05');

create table category (category_id int primary key,category_name varchar(100));
insert into category (category_id, category_name) values (1, 'electronics'),(2, 'clothing'),(3, 'grocery'),(4, 'furniture'),(5, 'sports');

create table product (product_id int primary key,product_name varchar(100),category_id int,unit_price decimal(10,2),
foreign key (category_id) references category(category_id));
insert into product (product_id, product_name, category_id, unit_price) values(201, 'laptop', 1, 55000.00),(202, 'mobile phone', 1, 25000.00),
(203, 'headphones', 1, 3000.00),(204, 't-shirt', 2, 1200.00),(205, 'jeans', 2, 2200.00),(206, 'rice', 3, 800.00),(207, 'coffee', 3, 450.00),
(208, 'office chair', 4, 7500.00),(209, 'table', 4, 12000.00),(210, 'cricket bat', 5, 3500.00);

create table customer (customer_id int primary key,customer_name varchar(100),region varchar(50));
insert into customer (customer_id, customer_name, region) values(301, 'karthik', 'south'),(302, 'lavanya', 'south'),
(303, 'manoj', 'north'),(304, 'nisha', 'west'),(305, 'omkar', 'east'),(306, 'priya', 'south'),
(307, 'rahul', 'north'),(308, 'sanjay', 'west'),(309, 'tanya', 'east'),(310, 'vijay', 'south');

create table orders (order_id int primary key,customer_id int,order_date date,foreign key (customer_id) references customer(customer_id));
insert into orders (order_id, customer_id, order_date) values(401, 301, '2026-01-05'),(402, 302, '2026-01-08'),(403, 303, '2026-01-12'),
(404, 304, '2026-01-15'),(405, 305, '2026-01-18'),(406, 306, '2026-01-20'),(407, 307, '2026-01-25'),(408, 308, '2026-02-02'),
(409, 309, '2026-02-05'),(410, 310, '2026-02-10'),(411, 301, '2026-02-15'),(412, 302, '2026-02-18'),(413, 303, '2026-02-20'),
(414, 304, '2026-02-25'),(415, 305, '2026-03-01');

create table fact_sales (sale_id int primary key,order_id int,product_id int,quantity int,sales_amount decimal(12,2),batch_id int,
foreign key (order_id) references orders(order_id),foreign key (product_id) references product(product_id));
insert into fact_sales (sale_id, order_id, product_id, quantity, sales_amount, batch_id) values(501, 401, 201, 1, 55000.00, 1001),
(502, 401, 203, 2, 6000.00, 1001),(503, 402, 202, 1, 25000.00, 1001),(504, 403, 204, 3, 3600.00, 1001),(505, 404, 205, 2, 4400.00, 1001),
(506, 405, 206, 5, 4000.00, 1002),(507, 406, 207, 4, 1800.00, 1002),(508, 407, 208, 1, 7500.00, 1002),(509, 408, 209, 1, 12000.00, 1002),
(510, 409, 210, 2, 7000.00, 1002),(511, 410, 201, 1, 55000.00, 1003),(512, 411, 202, 2, 50000.00, 1003),
(513, 412, 203, 3, 9000.00, 1003),(514, 413, 204, 2, 2400.00, 1003),(515, 414, 205, 1, 2200.00, 1003),
(516, 415, 206, 10, 8000.00, 1004),(517, 401, 207, 5, 2250.00, 1004),(518, 402, 208, 2, 15000.00, 1004),(519, 403, 209, 1, 12000.00, 1004),
(520, 404, 210, 3, 10500.00, 1004);

create table staging_sales (sale_id int,order_id int,product_id int,quantity int,sales_amount decimal(12,2),validation_status varchar(20),
batch_id int);
insert into staging_sales(sale_id, order_id, product_id, quantity, sales_amount, validation_status, batch_id) values(501, 401, 201, 1, 55000.00, 'valid', 1001),
(502, 401, 203, 2, 6000.00, 'valid', 1001),(503, 402, 202, 1, 25000.00, 'valid', 1001),(504, 403, 204, 3, 3600.00, 'valid', 1001),
(505, 404, 205, 2, 4400.00, 'valid', 1001),(506, 405, 206, 5, 4000.00, 'valid', 1002),(507, 406, 207, 4, 1800.00, 'valid', 1002),
(508, 407, 208, 1, 7500.00, 'valid', 1002),(509, 408, 209, 1, 12000.00, 'valid', 1002),(510, 409, 210, 2, 7000.00, 'valid', 1002),
(511, 410, 201, 1, 55000.00, 'valid', 1003),(512, 411, 202, 2, 50000.00, 'valid', 1003),(513, 412, 203, 3, 9000.00, 'valid', 1003),
(514, 413, 204, 2, 2400.00, 'valid', 1003),(515, 414, 205, 1, 2200.00, 'valid', 1003);

create table etl_batch (batch_id int primary key,batch_date date,source_count int,staging_count int,warehouse_count int);
insert into etl_batch(batch_id, batch_date, source_count, staging_count, warehouse_count) values
(1001, '2026-01-05', 5, 5, 5),(1002, '2026-01-15', 5, 5, 5),(1003, '2026-02-01', 5, 5, 5),(1004, '2026-02-15', 5, 5, 5),
(1005, '2026-03-01', 5, 5, 5);

create table fact_sales_audit (audit_id int primary key auto_increment,sale_id int,action_type varchar(20),action_date datetime,foreign key (sale_id) references fact_sales(sale_id));

/* Task 41 – Department Salary Analysis using CTE */

with department_avg as (
select department_id,avg(salary) as department_average_salary from employee group by department_id)
select d.department_name,e.employee_name,e.salary as employee_salary,da.department_average_salary from employee e
join department d on e.department_id = d.department_id join department_avg da on e.department_id = da.department_id 
where e.salary > da.department_average_salary;

/* Task 42 – Top Five Products per Category */

with product_sales as (
select p.product_id,p.product_name,p.category_id,c.category_name,sum(fs.sales_amount) as total_sales from fact_sales fs
join product p on fs.product_id = p.product_id join category c on p.category_id = c.category_id group by
p.product_id,p.product_name,p.category_id,c.category_name
),
ranked_products as (
select category_name,product_name,total_sales,dense_rank() over (partition by category_id order by total_sales desc) as product_rank
from product_sales)
select category_name,product_name,total_sales,product_rank as `rank` from ranked_products where product_rank <= 5 order by category_name, product_rank;

/* Task 43 – Temporary Table for Top-Selling Products */

create temporary table top_selling_products as
select p.product_id,p.product_name,c.category_name,sum(fs.sales_amount) as total_sales from fact_sales fs
join product p on fs.product_id = p.product_id join category c on p.category_id = c.category_id
group by p.product_id,p.product_name,c.category_name order by total_sales desc
limit 5;

select sum(total_sales) as top_product_total_sales from top_selling_products;

/* Task 44 – Stored Procedure for Warehouse Loading */

delimiter $$
create procedure load_valid_sales()
begin insert into fact_sales (sale_id,order_id,product_id,quantity,sales_amount,batch_id)
select sale_id,order_id,product_id,quantity,sales_amount,batch_id from staging_sales where validation_status = 'valid';
end $$
delimiter ;

call load_valid_sales();

/* Task 45 – Fact Table Audit Trigger */

delimiter $$
create trigger trg_fact_sales_after_insert after insert on fact_sales
for each row
begin insert into fact_sales_audit(sale_id, action_type, action_date) values (new.sale_id, 'insert', now());
end $$
create trigger trg_fact_sales_after_update after update on fact_sales
for each row
begin insert into fact_sales_audit(sale_id, action_type, action_date)values(new.sale_id, 'update', now());
end $$
create trigger trg_fact_sales_after_delete after delete on fact_sales
for each row
begin insert into fact_sales_audit(sale_id, action_type, action_date) values(old.sale_id, 'delete', now());
end $$
delimiter ;

insert into fact_sales(sale_id, order_id, product_id, quantity, sales_amount, batch_id) values(521, 405, 201, 1, 55000.00, 1005);

/* Task 46 – Business Reporting View */

create view business_sales_report as
select c.customer_name,o.order_id,o.order_date,fs.product_id,fs.quantity,fs.sales_amount from customer c
join orders o on c.customer_id = o.customer_id join fact_sales fs on o.order_id = fs.order_id;
select *from business_sales_report;

/* Task 47 – Index Recommendation */

create index idx_orders_customer_id on orders(customer_id);
create index idx_orders_order_date on orders(order_date);
create index idx_fact_sales_order_id on fact_sales(order_id);
create index idx_fact_sales_product_id on fact_sales(product_id);

/* Task 48 – Batch-wise ETL Reconciliation Report */

select batch_id,source_count as source_record_count,staging_count as staging_record_count,warehouse_count as warehouse_record_count,
source_count - warehouse_count as difference from etl_batch order by batch_id;

/* Task 49 – Slowly Changing Dimension (SCD) Validation */

with history_ranked as (
    select
        employee_id,
        employee_name,
        department_id,
        salary,
        effective_date,
        row_number() over (
            partition by employee_id
            order by effective_date desc
        ) as rn
    from employee_history
),
previous_history as (
    select
        employee_id,
        employee_name,
        department_id,
        salary
    from history_ranked
    where rn = 2
)
select
    e.employee_id,
    e.employee_name,
    ph.salary as old_salary,
    e.salary as new_salary,
    old_d.department_name as old_department,
    new_d.department_name as new_department
from employee e
join previous_history ph
    on e.employee_id = ph.employee_id
join department old_d
    on ph.department_id = old_d.department_id
join department new_d
    on e.department_id = new_d.department_id
where ph.salary <> e.salary
   or ph.department_id <> e.department_id;