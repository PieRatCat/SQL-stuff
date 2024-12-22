SELECT a.region AS 'Region',
    AVG(b.snowfall_inches) AS 'Average snowfall'
FROM ski_resorts AS a
    LEFT JOIN snowfall AS b
    ON a.resort_id = b.resort_id
GROUP BY a.region
ORDER BY 'Average snowfall' DESC;