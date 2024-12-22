SELECT  a.vendor_name,
        SUM(b.quantity_sold * b.price_per_unit) AS total_revenue
FROM  vendors AS a LEFT JOIN sales AS b
        ON a.vendor_id = b.vendor_id

GROUP BY a.vendor_id
ORDER BY total_revenue DESC
LIMIT 2
;