WITH total_all AS
    (SELECT 
        SUM(weight_kg) AS total_all
    FROM gifts        
    )

SELECT
    recipient_type,
    SUM(weight_kg) AS total_weight,    
    ROUND(SUM(weight_kg) * 100 / total_all.total_all, 2) AS weight_percentage
FROM gifts, total_all
GROUP BY recipient_type
;
