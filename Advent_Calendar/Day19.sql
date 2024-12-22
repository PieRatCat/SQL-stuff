SELECT
    a.bear_name,
    MAX(b.food_weight_kg) AS biggest_meal_kg
FROM polar_bears AS a JOIN meal_log AS b
    ON a.bear_id = b.bear_id
WHERE b.date >= "2024-12-01" AND b.date <= "2024-12-31"
GROUP BY a.bear_id
ORDER BY MAX(b.food_weight_kg) DESC
;