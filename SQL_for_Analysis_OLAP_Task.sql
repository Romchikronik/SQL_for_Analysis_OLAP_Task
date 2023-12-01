-- Retrieve the total sales amount for each product category for a specific time period
SELECT
    p.prod_category,
    SUM(s.amount_sold) AS total_sales_amount
FROM
    sh.sales s
JOIN
    sh.products p ON s.prod_id = p.prod_id
JOIN
    sh.times t ON s.time_id = t.time_id
WHERE
    t.calendar_year = 2000  -- we can replace 2000 with with the desired year
GROUP BY
    p.prod_category;


-- Calculate the average sales quantity by region for a particular product
SELECT
    co.country_region,
    AVG(s.quantity_sold) AS average_quantity_sold
FROM
    sh.sales s
JOIN
    sh.customers c ON s.cust_id = c.cust_id
JOIN
    sh.countries co ON c.country_id = co.country_id
WHERE
    s.prod_id = 13 -- we can replace 13 with any actual product ID that we want (but average_quantity_sold will be the same because in sh.sales quantity_sold for every 1.00)
GROUP BY
    co.country_region;


-- Find the top five customers with the highest total sales amount
SELECT
    c.cust_id,
    c.cust_first_name,
    c.cust_last_name,
    SUM(s.amount_sold) AS total_sales
FROM
    sh.sales s
JOIN
    sh.customers c ON s.cust_id = c.cust_id
GROUP BY
    c.cust_id, c.cust_first_name, c.cust_last_name
ORDER BY
    total_sales DESC
LIMIT 5;
