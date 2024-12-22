SELECT candy_name,
    candy_category,
    calories,
    ROW_NUMBER() OVER (PARTITION BY candy_category ORDER BY calories DESC) AS rank
    
FROM candy_nutrition
;