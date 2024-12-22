SELECT 
    name,
    birthday
FROM family_members
WHERE SUBSTR(birthday, 6, 2) = '12'
;