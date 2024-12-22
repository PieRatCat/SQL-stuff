SELECT recipient,
    SUM(weight_kg)
FROM gifts
GROUP BY recipient