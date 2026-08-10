use project;
-- Module 3  Data Lake & Batch Processing
CREATE TABLE Batch_Master
(
    Batch_ID INT PRIMARY KEY,
    Batch_Name VARCHAR(100),
    Batch_Date DATE,
    Load_Status VARCHAR(20)
);

INSERT INTO Batch_Master VALUES (1,'Daily Load','2024-01-01','Success'),(2,'Daily Load','2024-01-02','Success'),(3,'Daily Load','2024-01-03','Failed'),
(4,'Daily Load','2024-01-04','Partial'),(5,'Daily Load','2024-01-05','Success');

CREATE TABLE Source_Customer
(Customer_ID INT PRIMARY KEY,Customer_Name VARCHAR(100),Email VARCHAR(100),Phone VARCHAR(20),City VARCHAR(100),Batch_ID INT,
FOREIGN KEY (Batch_ID)REFERENCES Batch_Master(Batch_ID));

INSERT INTO Source_Customer VALUES (1001,'Customer1','customer1@mail.com','9000001001','Chennai',1),(1002,'Customer2','customer2@mail.com','9000001002','Bangalore',2),
(1003,'Customer3','customer3@mail.com','9000001003','Hyderabad',3),(1004,'Customer4','customer4@mail.com','9000001004','Mumbai',4),
(1005,'Customer5','customer5@mail.com','9000001005','Delhi',5),(1006,'Customer6','customer6@mail.com','9000001006','Chennai',1),
(1007,'Customer7','customer7@mail.com','9000001007','Bangalore',2),(1008,'Customer8','customer8@mail.com','9000001008','Hyderabad',3),
(1009,'Customer9','customer9@mail.com','9000001009','Mumbai',4),(1010,'Customer10','customer10@mail.com','9000001010','Delhi',5),
(1011,'Customer11','customer11@mail.com','9000001011','Chennai',1),(1012,'Customer12','customer12@mail.com','9000001012','Bangalore',2),
(1013,'Customer13','customer13@mail.com','9000001013','Hyderabad',3),(1014,'Customer14','customer14@mail.com','9000001014','Mumbai',4),
(1015,'Customer15','customer15@mail.com','9000001015','Delhi',5),(1016,'Customer16','customer16@mail.com','9000001016','Chennai',1),
(1017,'Customer17','customer17@mail.com','9000001017','Bangalore',2),(1018,'Customer18','customer18@mail.com','9000001018','Hyderabad',3),
(1019,'Customer19','customer19@mail.com','9000001019','Mumbai',4),(1020,'Customer20','customer20@mail.com','9000001020','Delhi',5),
(1021,'Customer21','customer21@mail.com','9000001021','Chennai',1),(1022,'Customer22','customer22@mail.com','9000001022','Bangalore',2),
(1023,'Customer23','customer23@mail.com','9000001023','Hyderabad',3),(1024,'Customer24','customer24@mail.com','9000001024','Mumbai',4),
(1025,'Customer25','customer25@mail.com','9000001025','Delhi',5);


CREATE TABLE Staging_Customer
(Customer_ID INT,Customer_Name VARCHAR(100),Email VARCHAR(100),Phone VARCHAR(20),City VARCHAR(100),Batch_ID INT,Validation_Status VARCHAR(20),
FOREIGN KEY (Batch_ID)REFERENCES Batch_Master(Batch_ID));

INSERT INTO Staging_Customer VALUES
(1001,'Customer1','customer1@mail.com','9000001001','Chennai',1,'Valid'),(1002,'Customer2','customer2@mail.com','9000001002','Bangalore',2,'Invalid'),
(1003,'Customer3','customer3@mail.com','9000001003','Hyderabad',3,'Valid'),(1004,'Customer4','customer4@mail.com','9000001004','Mumbai',4,'Valid'),
(1005,'Customer5','customer5@mail.com','9000001005','Delhi',5,'Invalid'),(1006,'Customer6','customer6@mail.com','9000001006','Chennai',1,'Valid'),
(1007,'Customer7','customer7@mail.com','9000001007','Bangalore',2,'Valid'),(1008,'Customer8','customer8@mail.com','9000001008','Hyderabad',3,'Invalid'),
(1009,'Customer9','customer9@mail.com','9000001009','Mumbai',4,'Valid'),(1010,'Customer10','customer10@mail.com','9000001010','Delhi',5,'Valid'),
(1011,'Customer11','customer11@mail.com','9000001011','Chennai',1,'Invalid'),(1012,'Customer12','customer12@mail.com','9000001012','Bangalore',2,'Valid'),
(1013,'Customer13','customer13@mail.com','9000001013','Hyderabad',3,'Valid'),(1014,'Customer14','customer14@mail.com','9000001014','Mumbai',4,'Invalid'),
(1015,'Customer15','customer15@mail.com','9000001015','Delhi',5,'Valid'),(1016,'Customer16','customer16@mail.com','9000001016','Chennai',1,'Valid'),
(1017,'Customer17','customer17@mail.com','9000001017','Bangalore',2,'Invalid'),(1018,'Customer18','customer18@mail.com','9000001018','Hyderabad',3,'Valid'),
(1019,'Customer19','customer19@mail.com','9000001019','Mumbai',4,'Valid'),(1020,'Customer20','customer20@mail.com','9000001020','Delhi',5,'Invalid'),
(1021,'Customer21','customer21@mail.com','9000001021','Chennai',1,'Valid'),(1022,'Customer22','customer22@mail.com','9000001022','Bangalore',2,'Valid'),
(1023,'Customer23','customer23@mail.com','9000001023','Hyderabad',3,'Invalid'),(1024,'Customer24','customer24@mail.com','9000001024','Mumbai',4,'Valid'),
(1025,'Customer25','customer25@mail.com','9000001025','Delhi',5,'Valid'),(2026,'Customer26','customer26@mail.com','9000001026','Chennai',1,'Invalid'),
(2027,'Customer27','customer27@mail.com','9000001027','Bangalore',2,'Valid'),(2028,'Customer28','customer28@mail.com','9000001028','Hyderabad',3,'Valid'),
(2029,'Customer29','customer29@mail.com','9000001029','Mumbai',4,'Invalid'),(2030,'Customer30','customer30@mail.com','9000001030','Delhi',5,'Valid');

CREATE TABLE Warehouse_Customer
(Customer_ID INT PRIMARY KEY,Customer_Name VARCHAR(100),Email VARCHAR(100),Phone VARCHAR(20),City VARCHAR(100),Batch_ID INT,Load_Date DATE,
FOREIGN KEY (Batch_ID)REFERENCES Batch_Master(Batch_ID));

INSERT INTO Warehouse_Customer VALUES
(1001,'Customer1','customer1@mail.com','9000001001','Chennai',1,'2024-01-01'),(1002,'Customer2','customer2@mail.com','9000001002','Bangalore',2,'2024-01-02'),
(1003,'Customer3','customer3@mail.com','9000001003','Hyderabad',3,'2024-01-03'),(1004,'Customer4','customer4@mail.com','9000001004','Mumbai',4,'2024-01-04'),
(1005,'Customer5','customer5@mail.com','9000001005','Delhi',5,'2024-01-05'),(1006,'Customer6','customer6@mail.com','9000001006','Chennai',1,'2024-01-01'),
(1007,'Customer7','customer7@mail.com','9000001007','Bangalore',2,'2024-01-02'),(1008,'Customer8','customer8@mail.com','9000001008','Hyderabad',3,'2024-01-03'),
(1009,'Customer9','customer9@mail.com','9000001009','Mumbai',4,'2024-01-04'),(1010,'Customer10','customer10@mail.com','9000001010','Delhi',5,'2024-01-05'),
(1011,'Customer11','customer11@mail.com','9000001011','Chennai',1,'2024-01-01'),(1012,'Customer12','customer12@mail.com','9000001012','Bangalore',2,'2024-01-02'),
(1013,'Customer13','customer13@mail.com','9000001013','Hyderabad',3,'2024-01-03'),(1014,'Customer14','customer14@mail.com','9000001014','Mumbai',4,'2024-01-04'),
(1015,'Customer15','customer15@mail.com','9000001015','Delhi',5,'2024-01-05'),(1016,'Customer16','customer16@mail.com','9000001016','Chennai',1,'2024-01-01'),
(1017,'Customer17','customer17@mail.com','9000001017','Bangalore',2,'2024-01-02'),(1018,'Customer18','customer18@mail.com','9000001018','Hyderabad',3,'2024-01-03'),
(1019,'Customer19','customer19@mail.com','9000001019','Mumbai',4,'2024-01-04'),(1020,'Customer20','customer20@mail.com','9000001020','Delhi',5,'2024-01-05'),
(1021,'Customer21','customer21@mail.com','9000001021','Chennai',1,'2024-01-01'),(1022,'Customer22','customer22@mail.com','9000001022','Bangalore',2,'2024-01-02'),
(1023,'Customer23','customer23@mail.com','9000001023','Hyderabad',3,'2024-01-03'),(1024,'Customer24','customer24@mail.com','9000001024','Mumbai',4,'2024-01-04'),
(1025,'Customer25','customer25@mail.com','9000001025','Delhi',5,'2024-01-05');

CREATE TABLE Rejected_Records
(Reject_ID INT PRIMARY KEY,Customer_ID INT,Batch_ID INT,Reject_Reason VARCHAR(200),
FOREIGN KEY (Batch_ID)REFERENCES Batch_Master(Batch_ID));

INSERT INTO Rejected_Records VALUES(1,1002,1,'Invalid Email'),(2,1005,2,'Phone Missing'),(3,1008,3,'Duplicate Customer'),
(4,1011,3,'Invalid City'),(5,1014,4,'Email Missing'),(6,1017,4,'Phone Invalid'),(7,1020,5,'Duplicate Record'),(8,1023,5,'Validation Failed');

-- Task 21 – Compare today's batch record count with yesterday's batch.

with cte as
(select b.batch_date , count(c.batch_id) as total_records from batch_master b join staging_customer c on b.Batch_ID = c.Batch_ID
group by b.Batch_Date),
cte2 as(
select batch_date,total_records,lag(total_records) over (order by batch_date) as previous_record from cte)
select *, (total_records - previous_record) as difference from cte2;

-- Task 22 Identify duplicate records loaded into the staging table.

select customer_id,count(*) as duplicate_count from staging_customer group by customer_id having count(*) > 1;

-- Task 23 Find NULL values in mandatory columns.

select customer_id,customer_name,email,phone from staging_customer where  customer_id is null
or customer_name is null or email is null or phone is null;

-- Task 24 Generate batch-wise load statistics.

with staging_count as (select Batch_ID,COUNT(*) as total_records from staging_customer group by Batch_ID),
warehouse_count AS(SELECT Batch_ID,COUNT(*) AS Successfully_Loaded FROM Warehouse_Customer GROUP BY Batch_ID),
rejected_count AS (SELECT Batch_ID,COUNT(*) AS Rejected_Records FROM Rejected_Records GROUP BY Batch_ID)
SELECT b.Batch_ID,b.Batch_Date,COALESCE(s.Total_Records, 0) AS Total_Records_Received,COALESCE(w.Successfully_Loaded, 0) AS Successfully_Loaded_Records,
COALESCE(r.Rejected_Records, 0) AS Rejected_Records FROM Batch_Master b LEFT JOIN staging_count s ON b.Batch_ID = s.Batch_ID
LEFT JOIN warehouse_count w ON b.Batch_ID = w.Batch_ID LEFT JOIN rejected_count r ON b.Batch_ID = r.Batch_ID ORDER BY b.Batch_ID;

/* Task 25  Find records rejected during ETL processing. */

SELECT Customer_ID,Batch_ID,Reject_Reason FROM Rejected_Records;

/*Task 26  reate a Temporary Table containing invalid records for further validation. */

CREATE TEMPORARY TABLE Invalid_Customers AS SELECT Customer_ID,Customer_Name,Email,Phone,City,Batch_ID,Validation_Status FROM Staging_Customer
WHERE Validation_Status = 'Invalid';

SELECT * FROM Invalid_Customers;

/* Task 27  Find source records that failed to reach the target table. */

SELECT s.Customer_ID,s.Customer_Name FROM Source_Customer s LEFT JOIN Warehouse_Customer w ON s.Customer_ID = w.Customer_ID
WHERE w.Customer_ID IS NULL;

/* Task 28 Identify records loaded multiple times into the warehouse.*/

SELECT Customer_ID,COUNT(*) AS Number_of_Times_Loaded FROM Warehouse_Customer GROUP BY Customer_ID
HAVING COUNT(*) > 1;

/* Task 29 Generate source-to-target reconciliation report. */

WITH source_count AS(
SELECT Batch_ID, COUNT(*) AS Total_Source_Records FROM Source_Customer GROUP BY Batch_ID),
warehouse_count AS
(SELECT Batch_ID, COUNT(*) AS Total_Warehouse_Records FROM Warehouse_Customer GROUP BY Batch_ID),
rejected_count AS(
SELECT Batch_ID, COUNT(*) AS Total_Rejected_Records FROM Rejected_Records GROUP BY Batch_ID)
SELECT b.Batch_ID, COALESCE(s.Total_Source_Records, 0) AS Total_Source_Records,COALESCE(w.Total_Warehouse_Records, 0) AS Total_Warehouse_Records,
COALESCE(r.Total_Rejected_Records, 0) AS Total_Rejected_Records,COALESCE(s.Total_Source_Records, 0)- COALESCE(w.Total_Warehouse_Records, 0)- COALESCE(r.Total_Rejected_Records, 0) AS Difference
FROM Batch_Master b LEFT JOIN source_count s ON b.Batch_ID = s.Batch_ID
LEFT JOIN warehouse_count w ON b.Batch_ID = w.Batch_ID
LEFT JOIN rejected_count r ON b.Batch_ID = r.Batch_ID
ORDER BY b.Batch_ID;

/* Task 30 Find tables having the highest daily growth. */

WITH table_counts AS
(
    SELECT
        b.Batch_Date,
        'Staging_Customer' AS Table_Name,
        COUNT(*) AS Records_Loaded
    FROM Batch_Master b
    JOIN Staging_Customer s
        ON b.Batch_ID = s.Batch_ID
    GROUP BY b.Batch_Date

    UNION ALL

    SELECT
        b.Batch_Date,
        'Warehouse_Customer' AS Table_Name,
        COUNT(*) AS Records_Loaded
    FROM Batch_Master b
    JOIN Warehouse_Customer w
        ON b.Batch_ID = w.Batch_ID
    GROUP BY b.Batch_Date

    UNION ALL

    SELECT
        b.Batch_Date,
        'Rejected_Records' AS Table_Name,
        COUNT(*) AS Records_Loaded
    FROM Batch_Master b
    JOIN Rejected_Records r
        ON b.Batch_ID = r.Batch_ID
    GROUP BY b.Batch_Date
),
growth AS
(
    SELECT
        Batch_Date,
        Table_Name,
        Records_Loaded,
        Records_Loaded -
        LAG(Records_Loaded) OVER
        (
            PARTITION BY Table_Name
            ORDER BY Batch_Date
        ) AS Daily_Growth
    FROM table_counts
)
SELECT
    Batch_Date,
    Table_Name,
    Records_Loaded,
    Daily_Growth
FROM growth
ORDER BY Batch_Date, Table_Name;