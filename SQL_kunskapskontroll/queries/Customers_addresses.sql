SELECT	a.CustomerID,
		a.ShipToAddressID,
		e.FirstName,
		e.LastName,
		f.AddressLine1,
		f.City

FROM	Sales.SalesOrderHeader AS a
		INNER JOIN Sales.Customer AS b
		ON a.CustomerID = b.CustomerID
		INNER JOIN Person.BusinessEntityContact AS c
		ON b.PersonID = c.PersonID
		INNER JOIN Person.BusinessEntityAddress AS d
		ON c.BusinessEntityID = d.BusinessEntityID
		INNER JOIN Person.Person AS e
		ON b.PersonID = e.BusinessEntityID
		INNER JOIN Person.Address AS f
		ON d.AddressID = f.AddressID
;