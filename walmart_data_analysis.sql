USE [wall_mart]
GO

SELECT [Invoice_ID]
      ,[Branch]
      ,[City]
      ,[Customer_type]
      ,[Gender]
      ,[Product_line]
      ,[Unit_price]
      ,[Quantity]
      ,[VAT]
      ,[Total]
      ,[Date]
      ,[Time]
      ,[Payment_method]
      ,[cogs]
      ,[gross_margin_percentage]
      ,[gross_income]
      ,[Rating]
  FROM [dbo].[sales]

GO
SELECT
    time,
    CASE 
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:00:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM
    sales;


ALTER TABLE sales 
ADD time_of_day VARCHAR(20);

UPDATE sales
SET time_of_day = 
 CASE 
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:00:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END;
	select * from sales;

	SELECT date,
    CASE 
        WHEN DATEPART(WEEKDAY, date) = 1 THEN 'Sunday'
        WHEN DATEPART(WEEKDAY, date) = 2 THEN 'Monday'
        WHEN DATEPART(WEEKDAY, date) = 3 THEN 'Tuesday'
        WHEN DATEPART(WEEKDAY, date) = 4 THEN 'Wednesday'
        WHEN DATEPART(WEEKDAY, date) = 5 THEN 'Thursday'
        WHEN DATEPART(WEEKDAY, date) = 6 THEN 'Friday'
        WHEN DATEPART(WEEKDAY, date)= 7 THEN 'Saturday'
    END AS day_of_week
FROM 
    sales;

	ALTER TABLE sales 
ADD day_of_week VARCHAR(20);

UPDATE sales
SET day_of_week = 
 CASE 
        WHEN DATEPART(WEEKDAY, date) = 1 THEN 'Sunday'
        WHEN DATEPART(WEEKDAY, date) = 2 THEN 'Monday'
        WHEN DATEPART(WEEKDAY, date) = 3 THEN 'Tuesday'
        WHEN DATEPART(WEEKDAY, date) = 4 THEN 'Wednesday'
        WHEN DATEPART(WEEKDAY, date) = 5 THEN 'Thursday'
        WHEN DATEPART(WEEKDAY, date) = 6 THEN 'Friday'
        WHEN DATEPART(WEEKDAY, date)= 7 THEN 'Saturday'
    END;
	select * from sales;
SELECT DATE, 
    CASE 
        WHEN DATENAME(MONTH, date) = 'January' THEN 'JAN'
        WHEN DATENAME(MONTH, date) = 'February' THEN 'FEB'
        WHEN DATENAME(MONTH, date) = 'March' THEN 'MAR'
        WHEN DATENAME(MONTH, date) = 'April' THEN 'APR'
        WHEN DATENAME(MONTH, date) = 'May' THEN 'MAY'
        WHEN DATENAME(MONTH, date) = 'June' THEN 'JUN'
        WHEN DATENAME(MONTH, date) = 'July' THEN 'JUL'
        WHEN DATENAME(MONTH, date) = 'August' THEN 'AUG'
        WHEN DATENAME(MONTH, date) = 'September' THEN 'SEP'
        WHEN DATENAME(MONTH, date) = 'October' THEN 'OCT'
        WHEN DATENAME(MONTH, date) = 'November' THEN 'NOV'
        WHEN DATENAME(MONTH, date) = 'December' THEN 'DEC'
    END AS MONTHS
FROM sales;

ALTER TABLE SALES ADD MONTHS VARCHAR(20);
UPDATE SALES SET MONTHS= CASE 
        WHEN DATENAME(MONTH, date) = 'January' THEN 'JAN'
        WHEN DATENAME(MONTH, date) = 'February' THEN 'FEB'
        WHEN DATENAME(MONTH, date) = 'March' THEN 'MAR'
        WHEN DATENAME(MONTH, date) = 'April' THEN 'APR'
        WHEN DATENAME(MONTH, date) = 'May' THEN 'MAY'
        WHEN DATENAME(MONTH, date) = 'June' THEN 'JUN'
        WHEN DATENAME(MONTH, date) = 'July' THEN 'JUL'
        WHEN DATENAME(MONTH, date) = 'August' THEN 'AUG'
        WHEN DATENAME(MONTH, date) = 'September' THEN 'SEP'
        WHEN DATENAME(MONTH, date) = 'October' THEN 'OCT'
        WHEN DATENAME(MONTH, date) = 'November' THEN 'NOV'
        WHEN DATENAME(MONTH, date) = 'December' THEN 'DEC'
    END;

	SELECT * FROM SALES;
------ product analysis-----
	SELECT DISTINCT CITY,branch  FROM SALES;
	SELECT BRANCH,CITY, ROW_NUMBER() 
	OVER (PARTITION BY CITY ORDER BY BRANCH) AS branch_partition CITY FROM SALES ;

	select distinct product_line from sales;

select top 1 payment_method, count(payment_method) from sales group by payment_method;
select  top 1 product_line, count(product_line) from sales group by product_line;
select months, sum(total) as total_revenue_by_month from sales group by months;  
select distinct months from sales;
select top 1 months, max(cogs) as largest_cogs from sales group by months;
select  product_line, sum(total) as total_revenue from sales
group by product_line order by total_revenue desc; 
select top 1 city, sum(total) as total_revenue from sales
group by city order by total_revenue desc;
select product_line, sum(vat) as largest_vat from sales
group by product_line order by largest_vat desc;
select case when sum(total)
avg(select ) as average_sales from sales;
select product_line, avg(quantity) from sales group by product_line;
select product_line, case when quantity > avg(quantity) then 'Good'
else 'bad' end as remarks from sales group by product_line;
select branch, sum(quantity) as total_quantity from sales group by branch having sum(quantity)> (select avg(quantity) from sales);
select gender, count(gender) as no_of_person ,product_line from sales group by gender, product_line order by no_of_person desc;
select product_line,round(avg(rating),2) as avg_rating from sales group by product_line;

----- sales analysis----

select * from sales;
---------Number of sales made in each time of the day per weekday
-------Which of the customer types brings the most revenue?
-----Which city has the largest tax percent/ VAT (Value Added Tax)?
--------Which customer type pays the most in VAT?-----------
select  time_of_day, count(*) as total_sales, day_of_week from sales group by  time_of_day,day_of_week order by total_sales desc;
select customer_type, round(sum(total),2) as max_revenue from sales group by customer_type order by max_revenue desc;
select city,round(avg(VAT),2) as largest_tax from sales group by city;
select customer_type, round(sum(VAT),2) as max_tax from sales group by customer_type order by max_tax desc;
----------------------------------------------------------

-----customer analysis------

select * from sales;
--How many unique customer types does the data have?
--How many unique payment methods does the data have?
--What is the most common customer type?
--Which customer type buys the most?
--What is the gender of most of the customers?
--What is the gender distribution per branch?
--Which time of the day do customers give most ratings?
--Which time of the day do customers give most ratings per branch?
--Which day fo the week has the best avg ratings?
--Which day of the week has the best average ratings per branch?
-------------------------------------------
select distinct customer_type from sales;
select distinct payment_method from sales;
select customer_type,count(customer_type) from sales group by customer_type order by customer_type;
select branch, gender, count(gender) from sales group by gender, branch order by branch;
select gender, count(gender), customer_type from sales group by gender, customer_type ;

select time_of_day, avg(rating) from sales group by time_of_day;
select branch,time_of_day, avg(rating) as most_rating from sales group by time_of_day, Branch order by most_rating desc ;
select day_of_week, round(avg(rating),2) as best_average from sales group by day_of_week order by best_average desc;
select branch, day_of_week, round(avg(rating),2) as best_average from sales group by branch, day_of_week order by best_average desc;