SELECT beach_name, expected_temperature_c
FROM beach_temperature_predictions
WHERE expected_temperature_c > 30 AND date = '2024-12-25'
;