SELECT customer_name, COUNT(DISTINCT activity)
FROM rentals
GROUP BY customer_name
HAVING COUNT(DISTINCT activity) >1;