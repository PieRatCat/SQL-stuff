SELECT
    friend_name,
    COUNT(resolution) AS resolution_count,
    (SUM(is_completed) * 100 / COUNT(resolution)) AS percent_complete,      
    CASE        
            WHEN (SUM(is_completed) * 100 / COUNT(resolution)) > 75 THEN 'Green'
            WHEN (SUM(is_completed) * 100 / COUNT(resolution)) >= 50 
            AND  (SUM(is_completed) * 100 / COUNT(resolution)) <=75 THEN 'Yellow'
            WHEN (SUM(is_completed) * 100 / COUNT(resolution)) < 50 THEN 'Red'
            END AS success_category
FROM resolutions
GROUP BY friend_name
;