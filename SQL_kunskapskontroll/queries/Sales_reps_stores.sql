SELECT		
		a.SalesPersonID,
		c.[Group],
		d.JobTitle,
		e.FirstName,
		e.LastName,
		COUNT(a.Name) AS Stores
      
  FROM	Sales.Store AS a
		INNER JOIN Sales.SalesPerson AS b
		ON a.SalesPersonID = b.BusinessEntityID
		INNER JOIN Sales.SalesTerritory AS c
		ON b.TerritoryID = c.TerritoryID
		INNER JOIN HumanResources.Employee AS d
		ON b.BusinessEntityID = d.BusinessEntityID
		INNER JOIN Person.Person AS e
		ON d.BusinessEntityID = e.BusinessEntityID


GROUP BY a.SalesPersonID, c.[Group], d.JobTitle, e.FirstName, e.LastName
ORDER BY a.SalesPersonID