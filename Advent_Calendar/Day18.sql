SELECT
    a.activity_name,
    AVG(b.rating)
FROM activities AS a INNER JOIN activity_ratings as b
    ON a.activity_id = b.activity_id

GROUP BY a.activity_id
ORDER BY AVG(b.rating) DESC
LIMIT 2
;