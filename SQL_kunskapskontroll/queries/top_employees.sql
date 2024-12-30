SELECT	
		CONCAT_WS(' ', b.FirstName, b.MiddleName, b.LastName) AS EmployeeName,
		a.JobTitle,
		a.HireDate		
           
  FROM HumanResources.Employee AS a
	LEFT JOIN Person.Person AS b
	ON a.BusinessEntityID = b.BusinessEntityID
WHERE a.OrganizationLevel <= 1 OR a.OrganizationLevel IS NULL
ORDER BY a.OrganizationLevel ASC, a.HireDate ASC  
;
