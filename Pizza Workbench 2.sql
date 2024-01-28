create database Pizza_DB;
use Pizza_DB;

select * from pizza_sales;

-- 1. Total Revenue 

select round(sum(total_price), 2) as total_revenue from pizza_sales;

-- 2. Average Order Value

select round(sum(total_price)/count(distinct order_id), 2) as average_order_value from pizza_sales;

-- 3. Total Pizzas Sold

select sum(quantity) as total_pizzas_sold from pizza_sales;

-- 4. Total Orders

select count(distinct order_id) as total_orders from pizza_sales;

-- 5. Average Pizzas Per Order

select round(sum(quantity)/count(distinct order_id), 2) as average_pizza_per_order from pizza_sales;

-- 6. Daily Trend for Total Orders

select dayname(order_date) as order_day, count(distinct order_id) as total_orders_per_day from pizza_sales group by dayname(order_date)
 order by total_orders_per_day desc;
 
-- 7. Monthly Trend for Total Orders: 

select monthname(order_date) as order_month, count(distinct order_id) as total_orders_per_month from pizza_sales group by monthname(order_date)
 order by total_orders_per_month desc;
 
 -- 8. Percentage of Sales by Pizza Category:
 
 select pizza_category, round(100*sum(total_price)/(select sum(total_price) from pizza_sales), 2) 
 as sales_percentage_of_each_category
 from pizza_sales group by pizza_category;
 
 -- 9. Percentage of Sales by Pizza Size:
 
  select pizza_size, round(100*sum(total_price)/(select sum(total_price) from pizza_sales), 2) 
 as sales_percentage_of_each_size
 from pizza_sales group by pizza_size order by sales_percentage_of_each_size;
 
 -- 10. Total Pizzas Sold by Pizza Category:

 select pizza_category, sum(quantity)
 as pizza_sold_categorywise
 from pizza_sales group by pizza_category;
 
 -- 11. Top 5 Best Sellers by Revenue, Total Quantity and Total Orders
 
select pizza_name, round(sum(total_price), 2) as Revenue
 from pizza_sales group by pizza_name order by Revenue desc  limit 5;
 
 -- , sum(quantity) as total_qty, count(order_id) as total_orders
 
 select pizza_name, sum(quantity) as total_qty
 from pizza_sales group by pizza_name order by total_qty desc  limit 5;
 
 select pizza_name, count(distinct order_id) as total_orders
 from pizza_sales group by pizza_name order by total_orders desc  limit 5;
 
 -- 12. Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders
 
 select pizza_name, round(sum(total_price), 2) as Revenue
 from pizza_sales group by pizza_name order by Revenue asc  limit 5;
 
  select pizza_name, sum(quantity) as total_qty
 from pizza_sales group by pizza_name order by total_qty asc limit 5;
 
  select pizza_name, count(distinct order_id) as total_orders
 from pizza_sales group by pizza_name order by total_orders asc  limit 5;
 
 
 


 





