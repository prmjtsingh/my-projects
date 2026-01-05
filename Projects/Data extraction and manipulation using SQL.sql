-- Create Employees_us table
CREATE TABLE Employees_US (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50)
);

-- Insert sample data into Employees table
INSERT INTO Employees_us (EmployeeID, FirstName, LastName, Department) VALUES
(1, 'Alice', 'Smith', 'Finance'),
(2, 'Bob', 'Johnson', 'Engineering'),
(3, 'Charlie', 'Williams', 'Marketing'),
(4, 'Diana', 'Brown', 'Finance'),
(5, 'Edward', 'Jones', 'Engineering'),
(6, 'Fiona', 'Garcia', 'Marketing'),
(7, 'George', 'Miller', 'Finance'),
(8, 'Hannah', 'Wilson', 'Engineering');

-- % represent 0,1 or multiple characters
-- _ represent only 1 character

--1) Find Employees whose Last Name starts with 'S'.
select * from employees_us where lastname like 's%'

--2) Find Employees whose First Name ends with 'a'.
select * from employees_us where firstname like '%a'

--3) Find Employees whose Department contains 'Eng'.
select * from employees_us where department like '%eng%'

--4) Find Employees whose Last Name is exactly 5 characters long.
select * from employees_us where lastname like '_____'

--5) Find Employees whose First Name starts with 'C' or 'D'.
select * from employees_us where firstname like '[CD]%' 

--6) Find Employees whose Last Name contains 'son'.
select * from employees_us where lastname like '%son%'

--7) Find Employees whose First Name contains the letter 'i' as the second character.
select * from employees_us where firstname like '_i%'

--8) Find Employees whose Last Name starts with any letter between 'A' and 'L'.
select * from employees_us where lastname like '[a-l]%'

--9) Find Employees whose First Name does not contain 'o'.
select * from employees_us where firstname not like '%o%'

--10) Find Employees whose Last Name ends with 'a' and is exactly 5 characters long.
select * from employees_us where lastname like '____a'

select * from employees_us

--11) Find Employees whose Department starts with 'Mar' and ends with 'ing'.
select * from employees_us where department like 'mar%ing'

--12) Find Employees whose First Name has an 'a' in the third position.
select * from employees_us where firstname like '__a%'

--13) Find Employees whose Last Name starts with 'Br' or 'Bl'.
select * from employees_us where lastname like 'br%' or lastname like 'bl%'

--14) Find Employees whose First Name starts with a vowel.
select * from employees_us where firstname like '[aeiou]%'

--15) Find Employees whose First Name does not start with a consonant.
select * from employees_us where firstname not like '[^aeiou]%'

--16) Find Employees whose First Name starts with a consonant.
select * from employees_us where firstname like '[^aeiou]%'

------------------------------------------------------------Case Statement------------------------------------------

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(20),
    Price DECIMAL(10, 2),
    StockQuantity INT,
    Supplier VARCHAR(50),
    Rating DECIMAL(3, 1)
);

-- Insert data into the Products table
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity, Supplier, Rating) VALUES
(1, 'Wireless Mouse', 'Electronics', 25.99, 150, 'Tech Supplies', 4.5),
(2, 'Office Chair', 'Furniture', 120.00, 85, 'Comfort Co', 4.7),
(3, 'Water Bottle', 'Accessories', 15.00, 250, 'AquaGear', 4.3),
(4, 'Laptop Backpack', 'Accessories', 45.99, 200, 'GearUp', 4.6),
(5, 'Gaming Laptop', 'Electronics', 999.99, 45, 'Tech Supplies', 4.8),
(6, 'Desk Lamp', 'Furniture', 35.00, 120, 'LightHouse', 4.2),
(7, 'Bluetooth Speaker', 'Electronics', 59.99, 95, 'SoundWave', 4.4),
(8, 'Standing Desk', 'Furniture', 250.00, 50, 'Comfort Co', 4.9),
(9, 'Fitness Tracker', 'Electronics', 129.99, 180, 'FitTech', 4.7),
(10, 'Coffee Mug', 'Accessories', 9.99, 300, 'MugMasters', 4.1);

select * from Products

--Example1 : Add a column to categorize each product into categories high, medium & low
select *,
case
	when Price > 500 then 'High' 
	when Price<=500 and Price>=200 then 'Medium'
	else 'Low'
end as [High/Medium/Low]
from products

--Example2 : Provide priority to each category & sort the data according to that priority
select * from Products
order by 
case 
	when Category in ('Electronics') then 1
	when Category in ('Furniture') then 2
	else 3
end

-----------------------------------------------------Nested Case-----------------------------------------------------

select * from Products
--We need to group the data based on columns category & price into different categories i.e affordable & premium
select 
*,
case 
	when Category = 'Electronics' then
		case when Price>=300 then 'Premium Electronics'
		else 'Affordable Electronics'
		end 
	when Category = 'Furniture' then
		case when Price>=250 then 'Premium Furniture'
		else 'Affordable Furniture'
		end 
else 
		case when Price>=25 then 'Premium Accessories'
		else 'Affordable Accessories'
		end
end as [Groups]
from products

-----------------------------------------------Subqueries-------------------------------------------------------

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert data into Customers table
INSERT INTO Customers (customer_id, customer_name, email)
VALUES 
(1, 'Alice Smith', 'alice@example.com'),
(2, 'Bob Johnson', 'bob@example.com'),
(3, 'Charlie Brown', 'charlie@example.com');

-- Insert data into Orders table
INSERT INTO Orders (order_id, customer_id, order_date, amount)
VALUES 
(101, 1, '2024-07-15', 250.00),
(102, 1, '2024-08-05', 300.00),
(103, 2, '2024-08-10', 150.00),
(104, 3, '2024-06-25', 100.00);

--Fetch data from Customers table for particular order dates
select * from Customers
where customer_id in (
select distinct customer_id from Orders where order_date between '2024-08-01' and '2024-08-31'
)

select * from Customers
where customer_id in (
select distinct customer_id from Orders where order_date not between '2024-08-01' and '2024-08-31'
)

---------------------------------------------Case Study 1------------------------------------------------

create database [SQL Basics Questions]

use [SQL Basics Questions]

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(1, 'John', 'Doe', 'HR', 55000.00),
(2, 'Jane', 'Smith', 'IT', 75000.00),
(3, 'Emily', 'Jones', 'Finance', 65000.00),
(4, 'Michael', 'Brown', 'IT', 80000.00),
(5, 'Sarah', 'Davis', 'HR', 60000.00),
(6, 'David', 'Wilson', 'Finance', 70000.00),
(7, 'Laura', 'Garcia', 'IT', 72000.00),
(8, 'Robert', 'Miller', 'HR', 58000.00),
(9, 'Sophia', 'Martinez', 'Finance', 67000.00),
(10, 'James', 'Anderson', 'IT', 81000.00);

--1) How do you select all columns from the Employees table?
select * from Employees


--2) How do you select only the FirstName and Last Name columns from the Employees table?
select FirstName,LastName from Employees


--3) How do you find all employees who work in the 'IT' department?
select * from Employees where Department = 'IT'

--or

select * from Employees where Department like 'IT'


--4) How do you select employees with a salary greater than 70,000?
select * from Employees where Salary>70000


--5) How do you sort the results by Last Name in ascending order?
select * from Employees order by LastName asc
--or
select * from Employees order by LastName


--6) How do you select distinct departments from the Employees table?
select distinct Department from Employees


--7) How do you count the number of employees in each department?
select Department,count(*) [Number of Employees] from Employees group by Department
--
select department,count(employeeid) [Number of Employees] from Employees group by Department


--8) How do you find the maximum salary in the Employees table?
select max(salary) [Maximum salary] from Employees

--9) How do you find the average salary of employees in the 'Finance' department?
select avg(Salary) [Finance Average] from Employees where Department like 'Finance'


--10) How do you select employees whose last name starts with 'M'?
select * from Employees where LastName like 'm%'

-----------------------------------------Case Study 2------------------------------------------------

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(1, 'John', 'Doe', 'HR', 55000.00),
(2, 'Jane', 'Smith', 'IT', 75000.00),
(3, 'Emily', 'Jones', 'Finance', 65000.00),
(4, 'Michael', 'Brown', 'IT', 80000.00),
(5, 'Sarah', 'Davis', 'HR', 60000.00),
(6, 'David', 'Wilson', 'Finance', 70000.00),
(7, 'Laura', 'Garcia', 'IT', 72000.00),
(8, 'Robert', 'Miller', 'HR', 58000.00),
(9, 'Sophia', 'Martinez', 'Finance', 67000.00),
(10, 'James', 'Anderson', 'IT', 81000.00);

select * from Employees

--1. How do you select employees who work in the 'IT' department and have a salary greater than 75,000?
select * from employees where Department in ('IT') and Salary>=75000


--2. How do you find employees who work in the 'HR' department or have a salary less than 60,000?
select * from Employees where Department in ('HR') or Salary<60000


--3. How do you select employees who do not work in the 'Finance' department?
select * from Employees where Department not in ('Finance')

--or

select * from Employees where not Department = 'Finance'


--4. How do you find employees whose salary is between 60,000 and 70,000 and who work in the 'Finance' department?
select * from Employees where Salary between 60000 and 70000 and Department in ('Finance')


--5. How do you find employees who work in the 'IT' department and do not have a salary greater than 80,000?
select * from Employees where Department = 'Finance' and Salary<=80000

--or

select * from Employees where Department in ('Finance') and not Salary>80000


--6. How do you find employees who work in the 'HR' or 'Finance' departments and have a salary greater than 65,000?
select * from Employees where (Department in ('HR') OR Department in ('Finance')) and Salary>=65000

select * from Employees

--7. How do you select employees whose last name starts with 'D' and do not work in the 'HR' department?
select * from Employees where LastName like 'd%' and Department not in ('HR')


--8. How do you find employees who do not work in the 'IT' department and have a salary greater than 70,000?
select * from Employees where not Department = 'IT' and Salary>70000


--9. How do you select employees who work in the 'IT' department and either have a salary greater 
--than 75,000 or have the first name 'Laura'?
select * from Employees where (Salary>75000 or FirstName = 'Laura') and Department in ('IT')


--10. How do you find employees who do not work in the 'HR' or 'IT' departments?
select * from Employees where Department not in ('HR','IT')

-------------------------------Case Study 4---------------------------------------------

create database [SQL Questions]

use [SQL Questions]

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Country VARCHAR(50)
);

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, CustomerName, Country)
VALUES 
(1, 'Alice', 'USA'),
(2, 'Bob', 'UK'),
(3, 'Charlie', 'Canada'),
(4, 'David', 'USA'),
(5, 'Eve', 'Australia');

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ProductID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ProductID)
VALUES 
(101, 1, '2024-08-01', 1001),
(102, 1, '2024-08-03', 1002),
(103, 2, '2024-08-04', 1001),
(104, 3, '2024-08-05', 1003),
(105, 5, '2024-08-06', 1004);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Insert data into Products table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1001, 'Laptop', 1000),
(1002, 'Smartphone', 700),
(1003, 'Tablet', 500),
(1004, 'Headphones', 200),
(1005, 'Smartwatch', 300);

select * from Customers

select * from Orders

select * from Products


--1) Write an SQL query to find the names of customers who have placed an order.
select distinct CustomerName from customers c inner join Orders o on o.CustomerID = c.CustomerID

--2) Find the list of customers who have not placed any orders.
select distinct CustomerName from Customers c left join Orders o on O.CustomerID = C.CustomerID where o.OrderID is null

--3) List all orders along with the product name and price.
select distinct ProductName,Price from Orders o join Products p on o.ProductID = p.ProductID  


--4) Find the names of customers and their orders, including customers who haven't placed any orders.
select distinct CustomerName,OrderID from Customers c left join Orders o on o.CustomerID = c.CustomerID

--5) Retrieve a list of products that have never been ordered.
select distinct p.ProductID,ProductName from Products p left join Orders o on p.ProductID = o.ProductID where o.OrderDate is null

--6) Find the total number of orders placed by each customer.
select customername,count(orderid) [Number of Orders] from Customers c inner join Orders o on c.CustomerID = o.CustomerID
group by customername

--OR 
select customername,count(orderid) [Number of Orders] from Customers c LEFT join Orders o on c.CustomerID = o.CustomerID
group by customername

--7) Display the customers, the products they've ordered, and the order date. Include customers who haven't placed any orders.
select distinct CustomerName,p.ProductID,ProductName,OrderDate
from Customers c left join Orders o on c.CustomerID = o.CustomerID left join Products p on o.ProductID = p.ProductID

--8) Display the customers, the products they've ordered, and the order date.
select distinct CustomerName,p.ProductID,ProductName,OrderDate
from Customers c join Orders o on c.CustomerID = o.CustomerID left join Products p on o.ProductID = p.ProductID

--9) Identify pair of customers which live in the same country
select x.CustomerName from Customers x join Customers y ON x.Country=y.Country and x.CustomerID<>y.CustomerID

--10) Find the customer who has spent the most on their order
select CustomerName,sum(Price) as [Sum of Price] from Customers [c] inner join Orders [o] 
on c.CustomerID=o.CustomerID inner join Products [p] on o.ProductID=p.ProductID
GROUP BY CustomerName

--11) Find the customers who have ordered more than one type of product
select CustomerName, count(ProductID) from Customers [c] inner join Orders [o] on c.CustomerID=o.CustomerID
group by CustomerName
HAVING COUNT(ProductID)>1

--12) List all products and their corresponding orders, using RIGHT JOIN, including products that have never been ordered
select OrderID,p.ProductID,ProductName from Orders [o] right join Products [p] on o.ProductID=p.ProductID

--13) Retrieve all orders placed by the customers from the USA
select OrderID from Customers [c] inner join Orders [o] on c.CustomerID=o.CustomerID where Country in ('USA')

--14) Find the names of the customers who have ordered a product priced above 500
select distinct CustomerName from Customers [c] inner join Orders [o] on c.CustomerID=o.CustomerID inner join Products [p] on o.ProductID=p.ProductID where Price>500 

--15) Find the customers who have ordered the same product more than once
select CustomerName,count(ProductID) from Customers [c] inner join Orders [o] on c.CustomerID=o.CustomerID
GROUP BY CustomerName
having count(ProductID)>1

---------------------------------Rank, Dense rank and row number window-------------------------------------
CREATE TABLE Students (
    student_name VARCHAR(100),
    subject VARCHAR(100),
    marks INT
);


INSERT INTO Students (student_name, subject, marks)
VALUES 
-- Marks for Alice
('Alice', 'Math', 85),
('Alice', 'Science', 88),
('Alice', 'English', 92),

-- Marks for Bob
('Bob', 'Math', 90),
('Bob', 'Science', 78),
('Bob', 'English', 85),

-- Marks for Charlie
('Charlie', 'Math', 85),
('Charlie', 'Science', 82),
('Charlie', 'English', 80),

-- Marks for David
('David', 'Math', 92),
('David', 'Science', 91),
('David', 'English', 89),

-- Marks for Eve
('Eve', 'Math', 90),
('Eve', 'Science', 85),
('Eve', 'English', 87),

-- Marks for Frank
('Frank', 'Math', 75),
('Frank', 'Science', 72),
('Frank', 'English', 78),

-- Marks for Grace
('Grace', 'Math', 85),
('Grace', 'Science', 89),
('Grace', 'English', 90);

select * from Students
--Row_Number -> In case of a tie row numbers are assigned randomly
select *,ROW_NUMBER() over(order by marks desc) as [Row Number]
from Students

--Rank -> if there's a tie next rank/ranks will be skipped
select *,rank() over(order by marks desc) as [Rank Function]
from Students

--Dense_Rank -> if there's a tie ranks will not be skipped
select *,DENSE_RANK() over(order by marks desc) [Dense Rank]
from Students

--Row_Number -> In case of a tie row numbers are assigned randomly
select *,ROW_NUMBER() over(order by marks asc) as [Row Number]
from Students

--Rank -> if there's a tie next rank/ranks will be skipped
select *,rank() over(order by marks asc) as [Rank Function]
from Students

--Dense_Rank -> if there's a tie ranks will not be skipped
select *,DENSE_RANK() over(order by marks asc) [Dense Rank]
from Students

--Partion By

select * from Students
--Row_Number -> In case of a tie row numbers are assigned randomly
select *,ROW_NUMBER() over(PARTITION BY subject order by marks desc) as [Row Number Desc]
from Students

select *,ROW_NUMBER() over(PARTITION BY subject order by marks) as [Row Number Asc]
from Students

select *,ROW_NUMBER() over(PARTITION BY student_name order by marks desc) as [Row Number desc]
from Students

select *,ROW_NUMBER() over(PARTITION BY student_name order by marks) as [Row Number asc]
from Students

--Rank -> if there's a tie next rank/ranks will be skipped
select *,rank() over(PARTITION BY student_name order by marks desc) as [Rank Desc]
from Students

select *,rank() over(PARTITION BY subject order by marks desc) as [Rank Desc]
from Students

--Dense_Rank -> if there's a tie ranks will not be skipped
select *,DENSE_RANK() over(PARTITION BY subject order by marks desc) [Dense Rank Desc]
from Students

select *,DENSE_RANK() over(PARTITION BY student_name order by marks desc) [Dense Rank Desc]
from Students

select *,DENSE_RANK() over(PARTITION BY student_name order by marks) [Dense Rank Asc]
from Students

--------------------------------------Lead Function---------------------------------------------
create database [Profit DB]

use [profit db]

-- Create a table to store monthly profit data for different products
CREATE  TABLE ProfitData (
    MonthNumber INT,
    MonthName VARCHAR(3),
    Product VARCHAR(50),
    Profit INT
);

-- Insert data into the ProfitData table
INSERT INTO ProfitData (MonthNumber, MonthName, Product, Profit) VALUES
(1, 'Jan', 'Product A', 1000),
(2, 'Feb', 'Product A', 1500),
(3, 'Mar', 'Product A', 1200),
(4, 'Apr', 'Product A', 1700),
(5, 'May', 'Product A', 1300),
(6, 'Jun', 'Product A', 1600),
(1, 'Jan', 'Product B', 2000),
(2, 'Feb', 'Product B', 2500),
(3, 'Mar', 'Product B', 2200),
(4, 'Apr', 'Product B', 2700),
(5, 'May', 'Product B', 2300),
(6, 'Jun', 'Product B', 2600);

select * from ProfitData

--To add a new column that shows next month's profit for each product
select *,lead(Profit) over(partition by product order by monthnumber) [Next Month's Profit]
from ProfitData

--We don't want product column in the output but we want each month's total profit to be show by monthnumber & monthname.
--A new column should be added to show next month's total profit
select monthnumber,monthname,sum(profit) [Total Profit],
lead(sum(profit)) over(order by monthnumber asc) [Next Month's Total Profit]
from ProfitData
group by MonthNumber,MonthName
order by MonthNumber

------------------------------------Is Null and Coalesce function------------------------------------
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber, Address)
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-1234', '123 Elm St'),
(2, 'Bob', 'Smith', NULL, '555-5678', NULL),
(3, 'Charlie', 'Williams', 'charlie.williams@example.com', NULL, '456 Oak St'),
(4, 'Diana', 'Brown', NULL, NULL, '789 Pine St'),
(5, 'Eve', 'Davis', 'eve.davis@example.com', '555-8765', NULL);

select * from Customers

select isnull(null,'1 st value null')

select isnull('abx',null)

select isnull(null,null)

select coalesce('A','B','C')

select coalesce(null,'B','C')

select coalesce(null,null,'C')

--
select * from Customers

select Customerid,email,phonenumber from Customers

select Customerid,isnull(email,'Email NA'),isnull(phonenumber,'Ph No NA') from Customers

select Customerid,coalesce(email,phonenumber,'Contact NA') [Coalesce Function] from Customers

--------------------------------First value window function-----------------------------------

CREATE DATABASE [Window Fun]

USE [Window Fun]

CREATE TABLE EmployeeSalaries (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Salary INT,
    Department VARCHAR(50)
);


INSERT INTO EmployeeSalaries (EmployeeID, EmployeeName, Salary, Department)
VALUES
(1, 'Alice', 50000, 'HR'),
(2, 'Bob', 60000, 'HR'),
(3, 'Charlie', 55000, 'HR'),
(4, 'David', 75000, 'Finance'),
(5, 'Eve', 80000, 'Finance'),
(6, 'Frank', 72000, 'Finance'),
(7, 'Grace', 90000, 'IT'),
(8, 'Heidi', 95000, 'IT'),
(9, 'Ivan', 87000, 'IT');

select * from EmployeeSalaries

select *
,FIRST_VALUE(Salary) over(order by salary asc) [Minimum Salary]
from EmployeeSalaries

select *
,FIRST_VALUE(EmployeeName) over(order by salary asc) [Emp with Minimum Salary]
,FIRST_VALUE(Salary) over(order by salary asc) [Minimum Salary]
from EmployeeSalaries


select * 
,FIRST_VALUE(EmployeeID) over(partition by department order by salary) [First Value]
from EmployeeSalaries

select * 
,FIRST_VALUE(EmployeeID) over(partition by department order by salary desc) [First Value EID]
,FIRST_VALUE(EmployeeName) over(partition by department order by salary desc) [First Value EName]
from EmployeeSalaries

--------------------------Last Value Function-------------------------------------
CREATE TABLE EmployeeSalaries (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Salary INT,
    Department VARCHAR(50)
);


INSERT INTO EmployeeSalaries (EmployeeID, EmployeeName, Salary, Department)
VALUES
(1, 'Alice', 50000, 'HR'),
(2, 'Bob', 60000, 'HR'),
(3, 'Charlie', 55000, 'HR'),
(4, 'David', 75000, 'Finance'),
(5, 'Eve', 80000, 'Finance'),
(6, 'Frank', 72000, 'Finance'),
(7, 'Grace', 90000, 'IT'),
(8, 'Heidi', 95000, 'IT'),
(9, 'Ivan', 87000, 'IT');

select * from EmployeeSalaries

select * 
,LAST_VALUE(EmployeeName) over(order by salary desc rows between unbounded preceding and unbounded following) [Emp with Lowest Salary]
from EmployeeSalaries

select * 
,LAST_VALUE(EmployeeName) over(order by salary desc rows between unbounded preceding and unbounded following) [Emp with Lowest Salary]
,LAST_VALUE(Salary) over(order by salary desc rows between unbounded preceding and unbounded following) [Lowest Salary]
from EmployeeSalaries

select * 
,LAST_VALUE(EmployeeName) over(partition by department
order by salary desc rows between unbounded preceding and unbounded following) [Emp with Lowest Salary]
,LAST_VALUE(Salary) over(partition by department order by salary desc rows between unbounded preceding and unbounded following) [Lowest Salary]
from EmployeeSalaries

---------------------------------Recursive Common Table Expressions-------------------------
--Factorial of a given number (5)

with [R CTE] as (
--Anchor Query
select 1 as n

union all

--Recursive Query
select n+1 from [R CTE] where n<=4

)

select exp(sum(log(n))) [Factorial] from [R CTE]

----------------------------------Stored Procedures-----------------------------------

create database testDB

use testdb

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);


INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, DepartmentID, HireDate, Salary)
VALUES 
(1, 'John', 'Smith', 'john.smith@example.com', 101, '2021-06-15', 75000.00),
(2, 'Jane', 'Doe', 'jane.doe@example.com', 102, '2020-03-10', 85000.00),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 101, '2019-11-22', 95000.00),
(4, 'Emily', 'Davis', 'emily.davis@example.com', 103, '2022-01-05', 68000.00),
(5, 'William', 'Brown', 'william.brown@example.com', 102, '2018-07-19', 80000.00);

select * from Employees

go
Create procedure sp_test
as
begin
    select * from Employees
end
go

Create proc sp_test_1
as
begin
	select firstname,lastname from Employees
end
go

go
Alter proc sp_test_1
as
begin
	select employeeid,firstname,lastname from Employees
end

---------------------------Views in MS SQL Server----------------------------------

select * from Employees

select * into emp_bkp from Employees

select * from emp_bkp


--A View is a virtual table,it is a stored SQL Query
--It helps in reducing the complexity of the code
--It helps in implementing security

go
create view View_1 as (
select * from emp_bkp
)
go

select * from View_1
--**
update View_1
set EmployeeID = 100
--**

go
Create view View_2 as (
select EmployeeID,FirstName,LastName,Email,DepartmentID,HireDate from emp_bkp
)
go


--------------------Nth Highest Salary-------------------------------
CREATE DATABASE [Advanced SQL Questions]

use [Advanced SQL Questions]

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(100),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, EmployeeName, Salary)
VALUES
(1, 'Alice Smith', 70000.00),
(2, 'Bob Johnson', 85000.00),
(3, 'Carol White', 95000.00),
(4, 'David Brown', 60000.00),
(5, 'Eve Davis', 75000.00),
(6, 'Frank Miller', 90000.00),
(7, 'Grace Lee', 80000.00),
(8, 'Hannah Clark', 62000.00),
(9, 'Ivy Harris', 74000.00),
(10, 'Jack Lewis', 98000.00);

select * from Employees

--2nd Highest Salary
select max(salary) [2nd Highest Salary] from employees where salary<
(select max(salary) from Employees)

--3rd highest salary
select max(salary) [3rd Highest Salary] from employees where salary< (
select max(salary) from employees where salary<
(select max(salary) from Employees))

--CTE
with cte as(
select *,DENSE_RANK() over(order by salary desc) [DR] from Employees
)

select salary [2nd Highest Salary] from cte where DR = 2

--3rd Highest Salary
with cte as(
select *,DENSE_RANK() over(order by salary desc) [DR] from Employees
)

select salary [3rd Highest Salary] from cte where DR = 3

--Sub Query along with Dense_Rank()

select salary as [2nd highest salary] from
(select *, DENSE_RANK() over(order by salary desc) [DR] from Employees) as x
where DR = 2


select salary as [3rd highest salary] from
(select *, DENSE_RANK() over(order by salary desc) [DR] from Employees) as x
where DR = 3

--Sub Query
select top 1 salary [2nd Highest Salary] from 
(select distinct top 2 salary from Employees order by Salary desc) as x
order by Salary asc


--3rd Highest Salary
select top 1 salary [3rd Highest Salary] from 
(select distinct top 3 salary from Employees order by salary desc) y
order by Salary asc

------------Reportee and Manager Question for data extraction and manipulation------------------
-- Create the table
CREATE TABLE ReportingStructure (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    ManagerID INT
);

-- Insert data into the table
INSERT INTO ReportingStructure (EmployeeID, EmployeeName, ManagerID) VALUES
(1, 'Alice Smith', NULL),  -- Alice Smith is at the top and reports to no one
(2, 'Bob Johnson', 1),     -- Bob Johnson reports to Alice Smith
(3, 'Carol White', 1),     -- Carol White reports to Alice Smith
(4, 'David Brown', 2),     -- David Brown reports to Bob Johnson
(5, 'Eve Davis', 2),       -- Eve Davis reports to Bob Johnson
(6, 'Frank Miller', 3);    -- Frank Miller reports to Carol White

select * from ReportingStructure

select b.employeename [Reportee],A.employeename [Manager]
from
ReportingStructure A inner join reportingstructure B
on a.employeeid = b.managerid

union all

select employeename,null [Manager] from reportingstructure
where managerid is null

--------------------------Deleting Duplicates Part 1--------------------------
-- Create the table with potential duplicates
CREATE TABLE EmployeeRecords (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    ManagerID INT
);


-- Insert data into the table, including duplicates
INSERT INTO EmployeeRecords (EmployeeID, EmployeeName, ManagerID) VALUES
(1, 'Alice Smith', NULL),
(2, 'Bob Johnson', 1),
(3, 'Carol White', 1),
(4, 'David Brown', 2),
(5, 'Eve Davis', 2),
(6, 'Frank Miller', 3),
(2, 'Bob Johnson', 1),  -- Duplicate entry
(4, 'David Brown', 2);  -- Duplicate entry

select * from EmployeeRecords
order by EmployeeID,EmployeeName,ManagerID

With CTE as (
select *, row_number() over(partition by employeeid,employeename,managerid order by employeeid) [Row Number] from EmployeeRecords
)

delete from cte where [Row Number] = 2

--Another way
With CTE_2 as (
select *, row_number() over(partition by employeeid order by employeeid) [Row Number] from EmployeeRecords
)
select * from CTE_2

-----------------------
select * into emprecords_bkp from EmployeeRecords

select * from emprecords_bkp

select distinct * into #1 from emprecords_bkp

truncate table emprecords_bkp

insert into emprecords_bkp select * from #1

select * from #1

-------------------Deleting Duplicates Part 2-----------------------
-- Create the table with EmployeeID and Email
CREATE TABLE EmployeeRecords_1 (
    EmployeeID INT,
    Email VARCHAR(100)
);


-- Insert data into the table, including duplicates
INSERT INTO EmployeeRecords_1 (EmployeeID, Email) VALUES
(1, 'alice@example.com'),
(2, 'bob@example.com'),
(3, 'carol@example.com'),
(4, 'david@example.com'),
(2, 'bob@example.com'),        -- Duplicate entry (same EmployeeID and Email)
(4, 'david@example.com'),      -- Duplicate entry (same EmployeeID and Email)
(5, 'shared@example.com'),     -- Valid case: Same email, different EmployeeID
(6, 'shared@example.com');     -- Valid case: Same email, different EmployeeID

select * from EmployeeRecords_1
order by Employeeid,email

select distinct * into #1 from EmployeeRecords_1

truncate table EmployeeRecords_1

insert into EmployeeRecords_1 select * from #1

select * from EmployeeRecords_1 order by email

--Record with Lower Employee ID should remain
with cte as (
select *, DENSE_RANK() over(partition by email order by employeeid) [DR] from EmployeeRecords_1
)

delete from cte where dr = 2

select * from EmployeeRecords_1

select * into employeerecords_2 from #1

select * from employeerecords_2 order by email

--Retail the record with higher Employee id
with cte as (
select *, DENSE_RANK() over(partition by email order by employeeid desc) [DR] from employeerecords_2
)

delete from cte where DR = 2

select * from employeerecords_1 --Employeeid = 5 was retained

select * from employeerecords_2 --Employeeid = 6 was retained