WITH employee_record AS (

SELECT 
	CONCAT_WS(' ', FirstName, MiddleName, LastName) AS PersonName,
	c.City AS City,
	d.Name AS State
		
FROM Person.Person AS a LEFT JOIN Person.BusinessEntityAddress AS b
	ON a.BusinessEntityID = b.BusinessEntityID LEFT JOIN Person.Address AS c
	ON b.AddressID = c.AddressID LEFT JOIN Person.StateProvince AS d
	ON c.StateProvinceID = d.StateProvinceID
WHERE a.PersonType = 'EM'

)
, address_select AS (
SELECT
	ROW_NUMBER() OVER(PARTITION BY City ORDER BY PersonName) AS row_number,
	PersonName,
	City,
	State
FROM employee_record
)

SELECT
	PersonName,
	City,
	State
FROM address_select
WHERE row_number = 1
;