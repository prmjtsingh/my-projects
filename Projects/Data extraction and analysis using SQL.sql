--Creating test database
create database test_env

--Activating test database
use test_env

--Checking the columns from products table
select * from [dbo].[Products]

--Checking everything from inventory dataset
select * from [dbo].[Test Environment Inventory Dataset]

--Checking distinct values in demand column
select distinct demand from 
[dbo].[Test Environment Inventory Dataset]

--Left joining inventory dataset and products table
select a.[Order_Date_DD_MM_YYYY],
a.product_id,a.availability,a.demand,b.product_name,b.unit_price
from [dbo].[Test Environment Inventory Dataset] as a
left join products as b on a.product_id=b.product_id

--Copying everything obtained from left joining inventory table and products table into a new table
 select * into new_table from 
(select a.[Order_Date_DD_MM_YYYY],
a.product_id,a.availability,a.demand,b.product_name,b.unit_price

from [dbo].[Test Environment Inventory Dataset] as a
left join products as b on a.product_id=b.product_id) x

--Checking everything in the new table
select * from new_table

------------------------------------------------

--Creating production database
create database PROD

--Activating production database
USE PROD

--Checking everything in Inventory dataset in production database
SELECT * FROM [dbo].[Prod Env Inventory Dataset]

--Checking distinct order dates where order dates is null to look for rows with no order date as it should not happen
SELECT distinct Order_Date_(DD_MM_YYYY)
FROM [dbo].[Prod Env Inventory Dataset]
where Order_Date_(DD_MM_YYYY) is null or Order_Date_(DD_MM_YYYY) = ''

--Since there were extra product ID's in production dataset which was a mistake in the production dataset, we will replace the extra ID's shown below with valid product ID's to match the test dataset 
--21 ---> 7
--22 ---> 11

--Checking for product ID's where order date is null to check the dataset. Fortunately there are none.
SELECT distinct Product_ID
FROM [dbo].[Prod Env Inventory Dataset] 
where Order_Date_DD_MM_YYYY is null or Order_Date_DD_MM_YYYY = ''
order by Product_ID

--Replacing product ID 21 with product ID 7
update [dbo].[Prod Env Inventory Dataset]
set Product_ID = 7 where Product_ID =21

--Replacing product ID 22 with product ID 11
update [dbo].[Prod Env Inventory Dataset]
set Product_ID = 11 where Product_ID =22

--Checking everything from products table
select * from [dbo].[Products]

--Checking distinct productID from products table
select distinct productid from [dbo].[Products]

--Checking total number of rows in products table to know if duplicates are present
select count(*) from [dbo].[Products]

--Deleting duplicate records from sales table
With CTE as (
select *, row_number() over(partition by productid,productname,unitprice order by productid) [Row Number] from [dbo].[Products]
)

--Checking second highest unit price to match with unit price in test dataset
select max(unitprice) [2nd Highest price] from [dbo].[Products] where unitprice<
(select max(unitprice) from [dbo].[Products])

--Checking third highest unit price to match with unit price in test dataset
with cte as(
select *,DENSE_RANK() over(order by unitprice desc) [DR] from [dbo].[Products]
)

select unitprice [3rd Highest Price] from cte where DR = 3

--Checking availability column in production inventory dataset. No issue found.
select distinct Availability from [dbo].[Prod Env Inventory Dataset]

--Checking demand column in production inventory dataset. No issues found.
select distinct Demand from [dbo].[Prod Env Inventory Dataset]

--Matching the column names in inventory dataset (production environment) with dataset in test environment and copying the output of left join of inventory dataset and product dataset into a new table in production environment to be further used to prepare charts.
select * into new_table from 
(select a.[Order_Date_(DD_MM_YYYY)] as Order_Date_DD_MM_YYYY,
a.productid as Product_id,a.Availability,a.Demand,b.productname as Product_name,b.unitprice as Unit_price
from [dbo].[Prod Env Inventory Dataset] as a
left join products as b on a.productid=b.productid) x


