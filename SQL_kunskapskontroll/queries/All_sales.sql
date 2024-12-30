SELECT 
		SalesOrderID,
		FORMAT(OrderDate, 'yyyy-MM-dd') AS OrderDate,
		OnlineOrderFlag,
		CustomerID,
		SalesPersonID,
		h.TerritoryID,
		t.Name,
		t.CountryRegionCode,
		TotalDue

  FROM Sales.SalesOrderHeader AS h
	LEFT JOIN Sales.SalesTerritory AS t
	ON h.TerritoryID = t.TerritoryID
  ;
