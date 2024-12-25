SELECT
    a.guest_name
FROM guests AS a LEFT JOIN guest_gifts AS b
    ON a.guest_id = b.guest_id
WHERE b.guest_id IS NULL
;