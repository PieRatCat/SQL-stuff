WITH employee_record AS (
SELECT 
	a.BusinessEntityID,
	c.City AS City,
	d.Name AS State,
	c.SpatialLocation,
	ROW_NUMBER() OVER(PARTITION BY City ORDER BY a.BusinessEntityID) AS row_number
		
FROM Person.Person AS a LEFT JOIN Person.BusinessEntityAddress AS b
	ON a.BusinessEntityID = b.BusinessEntityID LEFT JOIN Person.Address AS c
	ON b.AddressID = c.AddressID LEFT JOIN Person.StateProvince AS d
	ON c.StateProvinceID = d.StateProvinceID
WHERE a.PersonType = 'EM'
)

SELECT
	City,
	State,
	SpatialLocation
FROM employee_record
	
WHERE row_number = '1'
;