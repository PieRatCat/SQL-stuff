SELECT
    a.globe_name,
    a.material,
    COUNT(*) AS number_of_figurines

FROM snow_globes AS a JOIN figurines AS b
    ON a.globe_id = b.globe_id
GROUP BY a.globe_id
ORDER BY number_of_figurines DESC
LIMIT 3
;