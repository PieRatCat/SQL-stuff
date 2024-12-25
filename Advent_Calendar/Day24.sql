SELECT
    delivery_date,
    SUM(gifts_delivered) OVER (ORDER BY delivery_date 
                        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
                        AS cumulative_sum
FROM deliveries
;