SELECT
    category,
    SUM(quantity_sold * price_per_unit) AS revenue
FROM candy_sales
GROUP BY category
;