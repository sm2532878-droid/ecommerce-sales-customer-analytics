CREATE TABLE orders (
    order_id VARCHAR(20),
    order_date DATE,
    customer_id VARCHAR(20),
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INTEGER,
    unit_price NUMERIC(12,2),
    discount_percent NUMERIC(5,2),
    sales NUMERIC(14,2),
    profit NUMERIC(14,2),
    region VARCHAR(30),
    city VARCHAR(50),
    payment_method VARCHAR(50),
    profit_margin NUMERIC(8,4)
);
SELECT COUNT(*)
FROM orders;
SELECT *
FROM orders
LIMIT 10;
SELECT COUNT(*) FROM orders;

SELECT
    COUNT(*) AS total_rows,
    COUNT(order_id) AS order_ids,
    COUNT(order_date) AS order_dates,
    COUNT(customer_id) AS customers,
    COUNT(product_name) AS products,
    COUNT(category) AS categories,
    COUNT(quantity) AS quantities,
    COUNT(sales) AS sales,
    COUNT(profit) AS profits
FROM orders;

SELECT *FROM orders;

--1. --TOTAL SALES
SELECT SUM(sales) AS total_Sales
FROM orders;

--2.--TOTAL PROFIT
SELECT SUM(profit) AS total_profit
FROM orders;

--3. --TOTAL ORDERS
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM orders;

--4. --AVG SALES
SELECT AVG(sales) AS Avg_sales
FROM orders;

--5.--HIGHEST PROFIT
SELECT MAX(profit) AS Highest_profit
FROM orders;

--6.--LOWEST PROFIT
SELECT MIN(profit) AS lowest_profit
FROM orders;

--7.--TOTAL QUANTITY
SELECT SUM(quantity) AS total_quantity
FROM orders;

--8.--UNIQE CUSTOMER
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM orders;

--9.--AVG PROFIT
SELECT AVG(profit) AS Avg_profit
FROM orders;

--10.--HIGHEST SALES
SELECT MAX(sales) AS Highest_sales
FROM orders;

--11.Find the total sales where the city is Kolkata.
SELECT SUM(sales) AS total_sales_kolkata
FROM orders
WHERE city='Kolkata';

--12.Find the total sales for the Electronics category.
SELECT SUM(sales) AS total_sales_Electronic
FROM orders
WHERE category='Electronics';

--13.Find the total profit from the North region.
SELECT SUM(profit) AS total_profit_northregion
FROM orders
WHERE region='North';

--14.Find the total sales for orders where quantity is greater than 5.
SELECT SUM(sales) AS total_sales_greater5
FROM orders
WHERE quantity > 5;

--15.Find the total sales where the payment method is Cash.
SELECT SUM(sales) AS total_sales_cash
FROM orders
WHERE payment_method ='Cash';

--16.Find the total sales for each category.
SELECT category, SUM(sales) AS each_category
FROM orders
GROUP BY category;

--17.Find the total profit for each region.
SELECT region, SUM(profit) AS each_region
FROM orders
GROUP BY region;

--18.Find the number of orders for each payment method.
SELECT payment_method, COUNT(DISTINCT order_id) AS each_payment_method
FROM orders
GROUP BY payment_method;

--19.Find the total sales for each city.
SELECT city, SUM(sales) AS each_city
FROM orders
GROUP BY city;

--20.Find the average sales for each category.
SELECT category, AVG(sales) AS each_category_avg
FROM orders
GROUP BY category;

--21.Find the top 5 cities by total sales.
SELECT city,SUM(sales) AS total_sales
FROM orders
GROUP BY city ORDER BY total_sales DESC LIMIT 5;

--22.Find the top 5 products by total sales.
SELECT product_name,SUM(sales) AS total_sales
FROM orders
GROUP BY product_name ORDER BY total_sales DESC LIMIT 5;

--23.Find the 3 categories with the highest profit.
SELECT category,SUM(profit) AS total_profit
FROM orders
GROUP BY category ORDER BY total_profit DESC LIMIT 3;

--24.Find the 5 customers with the highest total sales.
SELECT customer_id,SUM(sales) AS total_sales
FROM orders
GROUP BY customer_id ORDER BY total_sales DESC LIMIT 5;

--25.Find the 10 orders with the highest sales value.
SELECT order_id,SUM(sales) AS total_sales
FROM orders
GROUP BY order_id ORDER BY total_sales DESC LIMIT 10;

--26.Find categories where total sales are greater than 1,000,000.
SELECT category,SUM(sales) AS total_sales
FROM orders
GROUP BY category HAVING  SUM(sales) > 1000000;

--27.Find regions where total profit is greater than 500,000.
SELECT region,SUM(profit) AS total_profit
FROM orders
GROUP BY region HAVING SUM(profit) >500000;

--28.Find customers who have placed more than 10 orders.
SELECT customer_id,COUNT(order_id) AS total_order
FROM orders
GROUP BY customer_id HAVING COUNT(order_id)>10;

--29.Find products whose average sales is greater than 5,000.
SELECT product_name,AVG(sales) AS avg_sales
FROM orders
GROUP BY product_name HAVING AVG(sales)>5000;

--30.Find cities whose total sales are greater than 500,000.
SELECT city,SUM(sales) AS total_sales
FROM orders
GROUP BY city HAVING SUM(sales)>500000;

--31.Create a result with: sales >= 10000 → High sales >= 5000 → Medium Otherwise → Low 
SELECT sales,
		CASE
			WHEN sales >= 10000 THEN 'High'
			WHEN sales >=5000 THEN ' Medium'
			ELSE 'low'
			END AS sales_category
FROM orders;

--32.Create a profit_category: profit >= 5000 → High Profit profit >= 2000 → Medium Profit Otherwise → Low Profit
SELECT profit,
		CASE
			WHEN profit >= 5000 THEN 'High ProfitT'
			WHEN profit>=2000 THEN 'Medium Profit'
			ELSE 'Low Profit'
			END AS profit_category
FROM orders;
			
--33.Create a quantity_category: quantity >= 8 → Large Order quantity >= 4 → Medium Order Otherwise → Small Order
SELECT quantity,
		CASE
			WHEN quantity >= 8 THEN 'Large Order'
			WHEN quantity >=4 THEN 'Medium Order'
			ELSE 'Small Order'
			END AS quantity_category
FROM orders;

--34.Create a discount_category: discount_percent >= 20 → High Discount discount_percent >= 10 → Medium Discount Otherwise → Low Discount
SELECT discount_percent,
		CASE
			WHEN discount_percent >= 20 THEN 'High Discount'
			WHEN discount_percent >=10 THEN 'Medium Discount'
			ELSE 'Low Discount'
			END AS discount_category
FROM orders;

--35.Create a profit_status: profit > 0 → Profitable profit = 0 → Break Even profit < 0 → Loss
SELECT profit,
		CASE
			WHEN profit > 0 THEN 'Profitable'
			WHEN profit = 0 THEN 'Break Even'
			ELSE 'Loss'
			END AS profit_status
FROM orders;

--36.Find the total sales for each year.
SELECT SUM(sales) AS total_sales ,EXTRACT(YEAR FROM order_date) AS year 
FROM orders
GROUP BY year ;

--37.Find the total sales for each month.
SELECT SUM(sales) AS total_sales ,EXTRACT(MONTH FROM order_date) AS month
FROM orders
GROUP BY month;

--38.Find the total number of orders placed in 2024.
SELECT COUNT( DISTINCT order_id) AS total_sales
FROM orders
WHERE EXTRACT(YEAR FROM order_date)=2024;

--39.Find the total sales generated during 2025.
SELECT SUM(sales) AS total_sales
FROM orders
WHERE EXTRACT(YEAR FROM order_date)=2025;

--40.Find the total sales for each month in 2025, and display the months from highest sales to lowest sales.
SELECT SUM(sales) AS total_sales,EXTRACT(MONTH FROM order_date) AS month
FROM orders
WHERE EXTRACT(YEAR FROM order_date)=2025
GROUP BY month
ORDER BY  total_sales DESC;

--41.Task: Display: order_id,customer_id,customer_name,sales using an INNER JOIN.
SELECT o.order_id,o.customer_id,c.customer_name,o.sales
FROM orders o INNER JOIN customers c
ON o.customer_id=c.customer_id;

--42.Find the total sales for each customer,showing:customer_id,customer_name,total_sales
SELECT o.customer_id,c.customer_name,SUM(o.sales) AS total_sales
FROM orders o INNER JOIN customers c
ON o.customer_id=c.customer_id
GROUP BY o.customer_id,c.customer_name;

--43.Display the customer name and number of orders placed by each customer.
SELECT c.customer_name,COUNT(DISTINCT o.order_id) AS number_orders
FROM orders o INNER JOIN customers c
ON o.customer_id=c.customer_id
GROUP BY c.customer_id,c.customer_name;

--44.Find the top 5 customers by total sales.Customer name,Total sales
SELECT c.customer_name,SUM(o.sales) AS total_sales
FROM orders o INNER JOIN customers c
ON o.customer_id=c.customer_id
GROUP BY o.customer_id,c.customer_name
ORDER BY total_sales  DESC LIMIT 5;

--45.Find customers whose total sales are greater than 50,000.
SELECT c.customer_name,SUM(o.sales) AS total_sales
FROM orders o INNER JOIN customers c
ON o.customer_id=c.customer_id
GROUP BY o.customer_id,c.customer_name
HAVING SUM(o.sales)>50000;

--46.Find all orders where sales is greater than the average sales of all orders.
SELECT order_id,customer_id,sales
FROM orders
WHERE sales > (
    SELECT AVG(sales)
    FROM orders;
);

--47.Find all orders where profit is greater than the average profit.
SELECT order_id,customer_id,profit
FROM orders
WHERE profit > (
	SELECT AVG(profit)
	FROM orders
);

--48.Find the order(s) having the highest sales value.
SELECT order_id,customer_id,sales
FROM orders
WHERE  sales = (
	SELECT MAX(sales)
	FROM orders
);

--49.Find customers whose total sales are greater than the average customer total sales.
SELECT customer_id,SUM(sales) AS total_sales
FROM orders
GROUP BY customer_id
HAVING SUM(sales) >(
	SELECT AVG(customer_total)
	FROM (
		  SELECT customer_id, SUM(sales) AS customer_total
          FROM orders
          GROUP BY customer_id
		) AS customer_sales
);

--50.Find the product(s) having the highest total sales.
SELECT product_name,SUM(sales) AS total_sales
FROM orders
GROUP BY product_name
	HAVING SUM(sales) =(
	SELECT MAX( product_total)
	FROM (
			SELECT product_name,SUM(sales) AS product_total
			FROM orders
			GROUP BY product_name
	) AS product_total
);

--51.Using a CTE, calculate the total sales for each customer.
WITH customer_sales AS(
	SELECT customer_id,SUM(sales) AS total_sales
	 FROM orders
	GROUP BY customer_id
)
SELECT * FROM customer_sales;

--52.Using a CTE, find the top 5 customers by total sales.
WITH customer_sales AS(
	SELECT customer_id,SUM(sales) AS total_sales
	 FROM orders
	GROUP BY customer_id
)
SELECT * FROM customer_sales
ORDER BY total_sales DESC LIMIT 5;

--53.Find the top 5 orders by sales and assign a ranking number to each order
WITH customer_sales AS(
	SELECT order_id,sales,
    ROW_NUMBER() OVER (ORDER BY sales DESC) AS rank
FROM orders
)
SELECT *FROM customer_sales
ORDER BY rank LIMIT 5;

--54.Rank each customer based on their total sales, with the highest-selling customer getting Rank 1.
 WITH customer_sales AS(
 SELECT customer_id,SUM(sales) AS total_sales
FROM orders
GROUP BY customer_id
)
SELECT
    customer_id,
    total_sales,
	RANK() OVER (ORDER BY total_sales DESC) AS rank
	FROM customer_sales;

--55.Find the total sales for each month in 2025 and show the previous month's sales alongside it.
WITH monthly_sales AS (
    SELECT
        EXTRACT(MONTH FROM order_date) AS month,
        SUM(sales) AS total_sales
    FROM orders
    WHERE EXTRACT(YEAR FROM order_date) = 2025
    GROUP BY month
)
SELECT
    month,
    total_sales,
    LAG(total_sales) OVER (
        ORDER BY month
    ) AS previous_month_sales
FROM monthly_sales
ORDER BY month;

--56.Find the total sales for each month in 2025 and show the next month's sales using LEAD().
WITH monthly_sales AS (
    SELECT
        EXTRACT(MONTH FROM order_date) AS month,
        SUM(sales) AS total_sales
    FROM orders
    WHERE EXTRACT(YEAR FROM order_date) = 2025
    GROUP BY month
)
SELECT
    month,
    total_sales,
    LEAD(total_sales) OVER (
        ORDER BY month
    ) AS next_month_sales
FROM monthly_sales
ORDER BY month;

--57.Find the top 10 customers by total profit.
SELECT o.customer_id,c.customer_name,SUM(o.profit) AS total_profit
FROM orders o INNER JOIN customers c
ON o.customer_id= c.customer_id
GROUP BY o.customer_id,c.customer_name
ORDER BY total_profit  DESC LIMIT 10;

--58.Find the total sales and total profit for each year.
SELECT EXTRACT(YEAR FROM order_date) AS year,SUM(sales) AS total_sales,SUM(profit) AS total_profit
FROM orders
GROUP BY year;

--59.Find the profit margin for each category.
SELECT category,SUM(sales) AS total_sales,SUM(profit) AS total_profit,(SUM(profit) / NULLIF(SUM(sales), 0)) * 100 AS profit_margin
FROM orders
GROUP BY category;

--60.Find the top 5 customers by total sales, but display only customers who have placed at least 10 orders.
SELECT o.customer_id,c.customer_name,COUNT(o.order_id) AS total_order ,SUM(o.sales) AS total_sales
FROM orders o INNER JOIN customers c
ON o.customer_id= c.customer_id
GROUP BY o.customer_id,c.customer_name
HAVING COUNT(o.order_id)>10
ORDER BY total_sales DESC LIMIT 5;

SELECT current_user;
ALTER USER postgres WITH PASSWORD 'MyPostgres@2026';