WITH rank_CTE AS 
	(
    SELECT 
    a.event_id,
    RANK() 
            OVER (PARTITION BY a.event_id 
            ORDER BY (b.calories / b.weight_g) DESC) AS calorie_rank
			FROM events AS a INNER JOIN menu AS b
			ON a.event_id = b.event_id   
	)
SELECT  
        (b.calories / b.weight_g) AS calorie_density,
        b.dish_name, 
        a.event_name,
        calorie_rank AS calorie_rank   
       
FROM events AS a INNER JOIN menu AS b
    ON a.event_id = b.event_id 
	JOIN rank_CTE ON a.event_id = rank_CTE.event_id

WHERE calorie_rank <= 3
;