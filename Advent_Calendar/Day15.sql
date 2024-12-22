SELECT TOP(3)
	a.name,
	COUNT(b.child_id) AS "number of children"
	
FROM family_members AS a JOIN parent_child_relationships AS b
	ON a.member_id = b.parent_id
GROUP BY a.name
ORDER BY COUNT(b.child_id) DESC

--in SQL Advent Calendar remove TOP(3) and uncomment the next line
-- LIMIT 3
;
