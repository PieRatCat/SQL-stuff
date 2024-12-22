SELECT
    a.vendor_name
FROM vendors as A LEFT JOIN item_prices as b
    ON a.vendor_id = b.vendor_id
WHERE b.price_usd < 10
GROUP BY a.vendor_name
;