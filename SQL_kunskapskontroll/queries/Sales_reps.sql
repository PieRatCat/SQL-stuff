SELECT	
		CONCAT_WS(' ', p.FirstName, p.LastName) AS EmployeeName,
		e.JobTitle AS JobTitle,
		t.Name AS Territory,
		t.CountryRegionCode AS Country,
		CAST(s.SalesYTD AS DECIMAL(9, 2)) AS SalesYTD,
		CAST(s.SalesLastYear AS DECIMAL(9,2)) AS SalesLastYear,
		COUNT(r.Name) AS Stores,
		CASE
  			WHEN t.CountryRegionCode = 'US' THEN 'USA'
			WHEN t.CountryRegionCode = 'CA' THEN 'CAN'
			WHEN t.CountryRegionCode = 'AU' THEN 'AUS'
			WHEN t.CountryRegionCode = 'GB' THEN 'GBR'
   			WHEN t.CountryRegionCode = 'DE' THEN 'DEU'
			WHEN t.CountryRegionCode = 'FR' THEN 'FRA'
			ELSE 'OTH'
		END AS CountryCode

FROM Sales.SalesPerson AS s
	LEFT JOIN HumanResources.Employee AS e
	ON s.BusinessEntityID = e.BusinessEntityID
	LEFT JOIN Person.Person AS p
	ON s.BusinessEntityID = p.BusinessEntityID
	LEFT JOIN Sales.SalesTerritory AS t
	ON s.TerritoryID = t.TerritoryID
	LEFT JOIN Sales.Store AS r
	ON s.BusinessEntityID = r.SalesPersonID

GROUP BY t.Name, t.CountryRegionCode, e.JobTitle, p.FirstName, p.LastName, s.SalesYTD, s.SalesLastYear
;