
CREATE database ELECTRIC;
USE ELECTRIC;

-- Q.1--
CREATE TABLE SALES
(
SALE_ID INT PRIMARY KEY,
PRODUCT_NAME VARCHAR(100),
CATEGORY VARCHAR(50),
QUANTITY_SOLD INT,
SALE_DATE DATE,
PRICE DECIMAL(10,2)
);

-- Q.2--
DESC SALES;

INSERT INTO SALES (sale_id, product_name, category, quantity_sold, sale_date, price)
VALUES
(1,'Laptop', 'Electronics', 20, '2024-01-10', 999.99),
(2,'Smartphone', 'Electronics', 50, '2024-01-11', 499.99),
(3,'Tablet', 'Electronics', 30, '2024-01-12', 299.99),
(4,'Desk Chair', 'Furniture', 15, '2024-01-13', 89.99),
(5,'Book', 'Stationery', 100, '2024-01-14', 15.99),
(6,'EirBuds', 'Electronics', 20, '2024-01-12', 999.99),
(7,'Smart Ring', 'Electronics', 50, '2024-01-16', 499.99),
(8,'AC', 'Electronics', 30, '2024-01-18', 299.99),
(9,'laptop Table', 'Furniture', 15, '2024-01-13', 89.99),
(10,'Pen Box', 'Stationery', 100, '2024-01-14', 15.99);

-- Q3. Find Total Sales by Product
SELECT SALE_ID,
SUM(quantity_sold * price) AS total_sales
FROM Sales
GROUP BY sale_id;

-- Q4.Display Count of Sales by Category
SELECT CATEGORY,COUNT(*)SALES_ID
FROM sales
GROUP BY CATEGORY;

-- Q5. Display Average Quantity Sold by Product
SELECT SALE_ID,
AVG(QUANTITY_SOLD)AS average_quentity_sold
from sales
group by SALE_ID;

-- Q6. Display Maximum Price of Products Sold
SELECT SALE_ID,
MAX(PRODUCT_NAME) AS maximun_pro_sold
from sales
group bY SALE_ID;

-- Q7. Display Total Quantity Sold by Category
SELECT category,
sum(quantity_sold) as Total_qty_sold
from sales
group by category;

-- Q8. Display Products Ordered by Total Sales Amount (Descending)
select product_name,
sum(quantity_sold * price) as total_sales_amount
from sales
group by product_name
order by total_sales_amount desc;

-- Q9. Display Average Price of Products Sold by Category
SELECT CATEGORY,
AVG(PRICE) AS AVG_PRICE
FROM SALES
GROUP BY CATEGORY
ORDER BY AVG_PRICE desc;

-- Q10. Display Count of Products Sold for Each Day
SELECT SALE_DATE,
SUM(QUANTITY_SOLD) AS total_product_sold
from sales
group by sale_date
order by total_product_sold desc;

-- Q11. Display Total Sales by Month (Assuming date is in the format YYYY-MM-DD)
select sale_date, date_format(sale_date, '%y-%m') as sale_month
from sales
group by sale_date
order by sale_month;

-- Q12. List Products with Quantity Sold Greater than 25, Ordered by Product Name.
select product_name,
sum(quantity_sold) as total_quantity_sold
from sales
group by product_name
having total_quantity_sold > 25
order by total_quantity_sold ;

-- Q13. Display Category with the Highest Average Price
select category,
avg(price) as highest_avg_price
from sales
group by category
order by highest_avg_price desc limit 1 ;

-- Q14. Display Top 3 Products by Quantity Sold.
select product_name,
sum(quantity_sold) as total_qty_sold
from sales
group by product_name
order by total_qty_sold desc limit 3;

-- Q15. Display Sales Data for Each Product Ordered by Sale Date
SELECT product_name,sale_date,quantity_sold,price    
FROM sales
ORDER BY sale_date ASC;

-- Q16. Display Total Sales for Each Category with Condition on Minimum Sales
select category,
sum(price) as total_sales
from sales
group by category
having sum(price) > 2000;

-- Q17. Display Count of Sales for Each Day Ordered by Date
select sale_date,
count(sale_id) as sale_count
from sales
group by sale_date
order by sale_date asc;

-- Q18. Display Products Ordered by Total Quantity Sold, Descending.
select product_name,
sum(quantity_sold) as total_qty_sold
from sales
group by product_name
order by total_qty_sold desc;

-- Q19. Display Average Sales Amount per Product, Ordered by Average Sales.
select product_name,
avg(price) as avg_sale
from sales
group by product_name
order by avg_sale;

-- Q20. Display Total Sales by Year
select year(sale_date) as sale_year,
sum(price) as total_sale
from sales
group by sale_date
order by total_sale desc;


