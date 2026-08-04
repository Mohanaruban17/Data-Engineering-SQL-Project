use project;
-- Module 2
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Gender VARCHAR(20),
    City VARCHAR(100),
    Region VARCHAR(50),
    Join_Date DATE
);

INSERT INTO Customer VALUES
(101,'Arun','Male','Chennai','South','2023-01-15'),
(102,'Priya','Female','Bangalore','South','2023-02-10'),
(103,'Rahul','Male','Mumbai','West','2023-03-18'),
(104,'Sneha','Female','Delhi','North','2023-04-12'),
(105,'Vijay','Male','Hyderabad','South','2023-05-20'),
(106,'Anjali','Female','Kolkata','East','2023-06-11'),
(107,'Kiran','Male','Pune','West','2023-07-05'),
(108,'Divya','Female','Chennai','South','2023-08-01'),
(109,'Rohit','Male','Delhi','North','2023-09-13'),
(110,'Meena','Female','Jaipur','North','2023-10-04'),
(111,'Ajay','Male','Lucknow','North','2023-10-20'),
(112,'Keerthi','Female','Coimbatore','South','2023-11-11'),
(113,'Suresh','Male','Vizag','East','2023-12-01'),
(114,'Nisha','Female','Bhubaneswar','East','2024-01-09'),
(115,'Harish','Male','Ahmedabad','West','2024-02-15'),
(116,'Lavanya','Female','Madurai','South','2024-03-18'),
(117,'Ganesh','Male','Surat','West','2024-04-12'),
(118,'Pooja','Female','Patna','East','2024-05-22'),
(119,'Ramesh','Male','Mysore','South','2024-06-15'),
(120,'Kavya','Female','Nagpur','West','2024-07-08');

CREATE TABLE Category(
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(100)
);

INSERT INTO Category VALUES
(1,'Electronics'),
(2,'Clothing'),
(3,'Grocery'),
(4,'Furniture'),
(5,'Sports'),
(6,'Beauty');

CREATE TABLE Product(
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(150),
    Category_ID INT,
    Unit_Price DECIMAL(10,2),
    FOREIGN KEY(Category_ID) REFERENCES Category(Category_ID)
);

INSERT INTO Product VALUES
(201,'Laptop',1,65000),
(202,'Mobile',1,25000),
(203,'Headphones',1,2500),
(204,'Smart Watch',1,5000),
(205,'T-Shirt',2,800),
(206,'Jeans',2,1800),
(207,'Jacket',2,2500),
(208,'Shoes',2,3200),
(209,'Rice Bag',3,1200),
(210,'Cooking Oil',3,180),
(211,'Milk',3,60),
(212,'Coffee Powder',3,450),
(213,'Dining Table',4,15000),
(214,'Chair',4,2500),
(215,'Sofa',4,35000),
(216,'Wardrobe',4,22000),
(217,'Cricket Bat',5,1800),
(218,'Football',5,900),
(219,'Face Wash',6,250),
(220,'Perfume',6,1500);

CREATE TABLE Sales(
    Sale_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Sale_Date DATE,
    Quantity INT,
    Total_Amount DECIMAL(12,2),
    FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID)
);

INSERT INTO Sales VALUES
(1,101,201,'2024-01-05',1,65000),
(2,102,205,'2024-01-07',2,1600),
(3,103,209,'2024-01-08',3,3600),
(4,104,220,'2024-01-10',1,1500),
(5,105,202,'2024-01-12',1,25000),
(6,106,213,'2024-01-15',1,15000),
(7,107,218,'2024-01-17',2,1800),
(8,108,219,'2024-01-18',3,750),
(9,109,206,'2024-01-20',2,3600),
(10,110,214,'2024-01-22',4,10000),
(11,111,203,'2024-01-24',2,5000),
(12,112,217,'2024-01-26',1,1800),
(13,113,210,'2024-01-28',5,900),
(14,114,211,'2024-02-01',10,600),
(15,115,216,'2024-02-03',1,22000),
(16,116,204,'2024-02-05',2,10000),
(17,117,208,'2024-02-08',1,3200),
(18,118,212,'2024-02-10',3,1350),
(19,119,207,'2024-02-12',2,5000),
(20,120,215,'2024-02-14',1,35000),
(21,101,205,'2024-02-16',4,3200),
(22,102,202,'2024-02-18',1,25000),
(23,103,219,'2024-02-20',5,1250),
(24,104,217,'2024-02-22',2,3600),
(25,105,209,'2024-02-25',1,1200),
(26,106,214,'2024-02-27',2,5000),
(27,107,203,'2024-03-01',3,7500),
(28,108,220,'2024-03-03',2,3000),
(29,109,201,'2024-03-05',1,65000),
(30,110,210,'2024-03-08',8,1440);

/* Task 11 Generate month-wise sales revenue. */

select date_format(sale_date,'%M-%Y') as sales_month, sum(total_amount) as total_revenue from sales group by date_format(sale_date,'%M-%Y');

/* Task 12 Find products contributing to 80% of total revenue.*/

WITH ProductRevenue AS
(SELECT p.Product_ID,p.Product_Name,SUM(s.Total_Amount) AS Revenue FROM Sales s JOIN Product p ON s.Product_ID = p.Product_ID
GROUP BY p.Product_ID, p.Product_Name),
RevenueAnalysis AS
(SELECT Product_ID,Product_Name,Revenue,SUM(Revenue) OVER(ORDER BY Revenue DESC) AS Running_Revenue,
SUM(Revenue) OVER() AS Total_Revenue,ROUND(SUM(Revenue) OVER(ORDER BY Revenue DESC) * 100.0/ SUM(Revenue) OVER(),
2) AS Revenue_Percentage FROM ProductRevenue)
SELECT Product_ID,Product_Name,Revenue,Running_Revenue,Revenue_Percentage FROM RevenueAnalysis WHERE Revenue_Percentage >= 80
ORDER BY Revenue DESC;

/*Task 13 Display products that have never been sold.*/

select p.product_id,p.product_name from product p left join sales s on p.product_id = s.product_id where s.product_id is null;

/*Task 14 Identify customers purchasing from multiple categories.*/

select c.Customer_ID,c.Customer_Name,count(distinct p.Category_ID) as Category_Count from Customer c join Sales s on c.Customer_ID = s.Customer_ID
join Product p on s.Product_ID = p.Product_ID group by c.Customer_ID, c.Customer_Name
having count(distinct p.Category_ID) > 1;

/*Task 15 Find the second highest selling product in every category */

with cte as(
select c.category_name,p.product_id,p.product_name, sum(s.quantity) as selling_product from product p join sales s on p.product_id = s.product_id join category c on
p.category_id = c.category_id group by p.product_id,p.product_name,c.category_name),
cte2 as
(select product_id,product_name,selling_product,category_name,dense_rank() over(partition by category_name order by selling_product desc) as rnk from cte)
select product_id,product_name,selling_product,category_name from cte2 where rnk=2;

/* Task 16 Generate customer lifetime value. */

select c.customer_id,c.customer_name,count(s.sale_id) as total_orders,sum(s.total_amount) as customer_lifetime_value from customer c join 
sales s on c.customer_id = s.customer_id group by c.customer_id,c.customer_name order by customer_lifetime_value desc;

/* Task 17 Display daily sales with previous day sales and next day sales. */

with cte as(
select sale_date,sum(total_Amount) as total_revenue from sales group by sale_date )
select sale_date , total_revenue , lag(total_revenue) over(order by sale_date) as previous_date , 
lead(total_revenue) over(order by sale_Date) as next_date from cte;

/* Task 18 Find the top five customers in each region.*/

with cte as
(select c.customer_id,c.customer_name,c.region,sum(s.total_Amount) as total_revenue from customer c join sales s on c.customer_id = s.customer_id 
group by c.customer_name,c.region,c.customer_id),
cte2 as(
select * , dense_rank() over(partition by region order by total_revenue desc) as rnk from cte)
select * from cte2 where rnk <= 5 ;

/*Task 19 Create a View for monthly sales reporting. */

create view monthly_report as
select monthname(sale_date) as sales_month , sum(total_amount) as total_revenue , count(sale_id) as total_order , sum(quantity) as total_quantity
from sales group by monthname(sale_date);
select * from monthly_report;

/*Task 20 Generate a CTE to simplify regional sales analysis.*/

with cte as(
select c.customer_id,c.region,count(s.sale_id) as total_order,sum(s.total_amount) as total_revenue from customer c
join sales s on c.customer_id = s.customer_id group by c.region,c.customer_id)
select region,count(customer_id) as total_customer,sum(total_order) as total_orders,sum(total_revenue) as total_revenue,avg(total_revenue) as average from cte group by region ;