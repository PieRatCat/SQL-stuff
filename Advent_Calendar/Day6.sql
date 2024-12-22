SELECT 
    a.bear_id,
    a.bear_name,
    SUM(b.distance_km) AS total_distance_traveled
    
FROM polar_bears as a LEFT JOIN tracking as b 
    ON a.bear_id = b.bear_id
WHERE b.date BETWEEN '2024-12-01' AND '2024-12-31'
GROUP BY a.bear_id
ORDER BY total_distance_traveled DESC
LIMIT 3
;