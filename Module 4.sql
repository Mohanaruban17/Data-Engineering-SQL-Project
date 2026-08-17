use project;
create table branch (branch_id int primary key,branch_name varchar(100),city varchar(100));
insert into branch(branch_id, branch_name, city)values(1, 'chennai main branch', 'chennai'),(2, 'bangalore central branch', 'bangalore'),
(3, 'hyderabad main branch', 'hyderabad'),(4, 'mumbai central branch', 'mumbai'),(5, 'delhi main branch', 'delhi');
create table customer1(customer_id int primary key,customer_name varchar(100),mobile_number varchar(15),city varchar(100));
insert into customer1(customer_id, customer_name, mobile_number, city) values
(101, 'arun kumar', '9876543210', 'chennai'),(102, 'priya sharma', '9876543211', 'bangalore'),(103, 'rahul verma', '9876543212', 'hyderabad'),
(104, 'sneha reddy', '9876543213', 'mumbai'),(105, 'vikram singh', '9876543214', 'delhi'),(106, 'karthik raj', '9876543215', 'chennai'),
(107, 'divya menon', '9876543216', 'bangalore'),(108, 'suresh babu', '9876543217', 'hyderabad'),(109, 'meena iyer', '9876543218', 'mumbai'),
(110, 'ajay patel', '9876543219', 'delhi');
create table account(account_id int primary key,customer_id int,branch_id int,account_type varchar(30),opening_date date,balance decimal(12,2),
account_status varchar(20),foreign key (customer_id) references customer(customer_id),foreign key (branch_id) references branch(branch_id));
insert into account (account_id, customer_id, branch_id, account_type, opening_date, balance, account_status)
values(1001, 101, 1, 'savings', '2022-01-10', 75000.00, 'active'),(1002, 101, 1, 'current', '2023-03-15', 120000.00, 'active'),
(1003, 102, 2, 'savings', '2021-06-20', 55000.00, 'active'),(1004, 102, 2, 'fixed deposit', '2023-01-05', 200000.00, 'active'),
(1005, 103, 3, 'savings', '2022-08-12', 85000.00, 'active'),(1006, 103, 3, 'current', '2024-02-10', 95000.00, 'active'),
(1007, 104, 4, 'savings', '2021-11-18', 45000.00, 'active'),(1008, 104, 4, 'fixed deposit', '2022-12-01', 150000.00, 'active'),
(1009, 105, 5, 'savings', '2020-09-25', 65000.00, 'active'),(1010, 105, 5, 'current', '2023-07-14', 110000.00, 'active'),
(1011, 106, 1, 'savings', '2024-01-10', 30000.00, 'active'),(1012, 106, 1, 'current', '2024-05-15', 70000.00, 'active'),
(1013, 107, 2, 'savings', '2022-04-20', 92000.00, 'active'),(1014, 107, 2, 'fixed deposit', '2023-08-25', 180000.00, 'active'),
(1015, 108, 3, 'savings', '2021-02-14', 38000.00, 'active'),(1016, 108, 3, 'current', '2024-06-10', 60000.00, 'active'),
(1017, 109, 4, 'savings', '2022-10-05', 72000.00, 'active'),(1018, 109, 4, 'fixed deposit', '2023-09-12', 250000.00, 'active'),
(1019, 110, 5, 'savings', '2020-12-20', 58000.00, 'active'),(1020, 110, 5, 'current', '2024-03-18', 90000.00, 'inactive');
create table transactions(transaction_id int primary key,account_id int,transaction_date date,transaction_type varchar(20),transaction_amount decimal(12,2),
foreign key (account_id) references account(account_id));
insert into transactions(transaction_id, account_id, transaction_date, transaction_type, transaction_amount)values
(5001, 1001, '2026-01-05', 'deposit', 15000.00),(5002, 1001, '2026-01-15', 'withdrawal', 5000.00),(5003, 1002, '2026-01-20', 'deposit', 25000.00),
(5004, 1002, '2026-02-05', 'withdrawal', 10000.00),(5005, 1003, '2026-02-10', 'deposit', 12000.00),(5006, 1004, '2026-02-15', 'deposit', 30000.00),
(5007, 1005, '2026-02-20', 'withdrawal', 7000.00),(5008, 1006, '2026-03-01', 'deposit', 18000.00),(5009, 1007, '2026-03-05', 'withdrawal', 4000.00),
(5010, 1008, '2026-03-10', 'deposit', 20000.00),(5011, 1009, '2026-03-15', 'deposit', 10000.00),(5012, 1010, '2026-03-20', 'withdrawal', 8000.00),
(5013, 1011, '2026-03-25', 'deposit', 15000.00),(5014, 1012, '2026-04-01', 'withdrawal', 6000.00),(5015, 1013, '2026-04-05', 'deposit', 22000.00),
(5016, 1014, '2026-04-10', 'deposit', 35000.00),(5017, 1015, '2026-04-15', 'withdrawal', 3000.00),(5018, 1016, '2026-04-20', 'deposit', 14000.00),
(5019, 1017, '2026-05-01', 'withdrawal', 9000.00),
(5020, 1018, '2026-05-05', 'deposit', 45000.00),
(5021, 1019, '2026-05-10', 'deposit', 11000.00),
(5022, 1020, '2026-05-15', 'withdrawal', 5000.00),
(5023, 1003, '2026-05-20', 'deposit', 16000.00),
(5024, 1005, '2026-06-01', 'withdrawal', 5500.00),(5025, 1009, '2026-06-05', 'deposit', 19000.00);
create table transaction_audit(audit_id int primary key,transaction_id int,account_id int,transaction_amount decimal(12,2),deleted_date datetime);
insert into transaction_audit (audit_id, transaction_id, account_id, transaction_amount, deleted_date)
values (1, 5002, 1001, 5000.00, '2026-01-16 10:30:00'),(2, 5007, 1005, 7000.00, '2026-02-21 11:15:00'),(3, 5012, 1010, 8000.00, '2026-03-21 14:20:00'),
(4, 5017, 1015, 3000.00, '2026-04-16 09:45:00'),(5, 5022, 1020, 5000.00, '2026-05-16 16:10:00');

/*Task 31 Generate branch-wise total deposits.*/

select b.branch_name,sum(t.transaction_amount) as total_deposit_amount from branch b join account a on b.branch_id = a.branch_id
join transactions t on a.account_id = t.account_id where t.transaction_type = 'deposit' group by b.branch_id, b.branch_name
order by total_deposit_amount desc;

/* Task 32 Identify customers with multiple active accounts. */

select c.customer_name,count(a.account_id) as number_of_active_accounts from customer c join account a on c.customer_id = a.customer_id
where a.account_status = 'active' group by c.customer_id, c.customer_name having count(a.account_id) > 1;

/* Task 33 Display the latest transaction for every account. */

with latest_transaction as (
select account_id,transaction_date,transaction_type,transaction_amount,row_number() over(partition by account_id 
order by transaction_date desc) as rn from transactions)
select account_id,transaction_date,transaction_type,transaction_amount from latest_transaction where rn = 1;

/* Task 34 Rank customers based on transaction amount.*/

select c.customer_name,sum(t.transaction_amount) as total_transaction_amount,rank() over (order by sum(t.transaction_amount) desc) as customer_rank
from customer c join account a on c.customer_id = a.customer_id join transactions t on a.account_id = t.account_id group by c.customer_id, c.customer_name
order by customer_rank;

/* Task 35  Identify suspicious transactions greater than three times the customer's average transaction amount. */

with customer_transactions as
(select c.customer_name,t.account_id,t.transaction_date,t.transaction_amount,avg(t.transaction_amount) over(partition by c.customer_id) 
as customer_avg_transaction_amount from customer c join account a on c.customer_id = a.customer_id join transactions t
on a.account_id = t.account_id)
select customer_name, account_id,transaction_date,transaction_amount,customer_avg_transaction_amount from customer_transactions
where transaction_amount > 3 * customer_avg_transaction_amount;

/* Task 36 Create a View for branch-wise transaction summary. */

create view branch_transaction_summary as select b.branch_name,count(t.transaction_id) as total_transactions,
sum(case when t.transaction_type = 'deposit'then t.transaction_amount
else 0
end) as total_deposit_amount,
sum(case when t.transaction_type = 'withdrawal'
then t.transaction_amount
else 0
end) as total_withdrawal_amount from branch b join account a on b.branch_id = a.branch_id join transactions t on a.account_id = t.account_id
group by b.branch_id, b.branch_name;

select * from branch_transaction_summary;

/* Task 37 Write a Stored Procedure to generate customer account statements.*/

delimiter //
create procedure get_account_statement(in p_account_id int)
begin select t.account_id,t.transaction_date,t.transaction_type,t.transaction_amount,a.balance as current_balance from transactions t
join account a on t.account_id = a.account_id where t.account_id = p_account_id order by t.transaction_date;
end //
delimiter ;

call get_account_statement(1001);

/* Task 38 – Deleted Transaction Audit Trigger */

delimiter //
create trigger before_transaction_delete before delete on transactions for each row
begin insert into transaction_audit(audit_id,transaction_id,account_id,transaction_amount,deleted_date) values(null,old.transaction_id,
old.account_id,old.transaction_amount,now());
end //
delimiter ;

/* Task 39 – Negative Transaction Validation Trigger */

delimiter //
create trigger before_transaction_insert before insert on transactions for each row
begin if new.transaction_amount < 0 then signal sqlstate '45000'set message_text = 'transaction amount cannot be negative';
end if;
end //
delimiter ;
insert into transactions(transaction_id, account_id, transaction_date, transaction_type, transaction_amount)
values(5026, 1001, '2026-06-10', 'deposit', -5000.00);

/* Task 40 – Transaction Search Performance Using Indexes  */

create index idx_transactions_account_date on transactions(account_id, transaction_date);