SELECT
	d.Name AS "Department",
	AVG(ph.Rate) AS "Average rate"
	
FROM HumanResources.EmployeePayHistory AS ph
	LEFT JOIN HumanResources.EmployeeDepartmentHistory AS dh
	ON ph.BusinessEntityID = dh.BusinessEntityID
	LEFT JOIN HumanResources.Department AS d
	ON dh.DepartmentID = d.DepartmentID

GROUP BY d.Name
ORDER BY AVG(ph.Rate) DESC
;