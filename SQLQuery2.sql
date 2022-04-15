USE AdventureWorks2019
GO
--1.
SELECT COUNT(ProductID) AS "Number of Products" FROM Production.Product;

--2.	
SELECT COUNT(ProductID) AS 'Num Prods in A' 
FROM Production.Product p
WHERE p.ProductSubcategoryID IS NOT NULL;

--3.	
SELECT ProductSubcategoryID, COUNT(ProductID) AS CountedProds 
FROM Production.Product AS p
WHERE p.ProductSubcategoryID IS NOT NULL
GROUP BY ProductSubcategoryID;

--4.
SELECT COUNT(ProductID) AS 'Num Prods Not in A' 
FROM Production.Product AS p
WHERE p.ProductSubcategoryID IS NULL;

--5.
SELECT SUM(Quantity) AS 'Summary of Prods' 
FROM Production.ProductInventory
GROUP BY ProductID;


--6.
SELECT ProductID, SUM(Quantity) AS QtySum
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY ProductID
HAVING SUM(Quantity) < 100;

--7.
SELECT Shelf, ProductID, SUM(Quantity) AS QtySum
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY ProductID, Shelf
HAVING SUM(Quantity) < 100;

--8.
SELECT ProductID, AVG(Quantity) AS QtyAvg
FROM Production.ProductInventory
WHERE LocationID = 10
GROUP BY ProductID;

--9.
SELECT ProductID, Shelf, AVG(Quantity) AS QtyAvg
FROM Production.ProductInventory
GROUP BY ProductID,Shelf;

--10.
SELECT ProductID, Shelf, AVG(Quantity) AS QtyAvg
FROM Production.ProductInventory
WHERE Shelf != 'N/A'
GROUP BY ProductID, Shelf;

--11.	
SELECT Color, Class, Count(*) AS TheCount, AVG(ListPrice) AS AvgPrice
FROM Production.Product
WHERE Color IS NOT NULL AND Class IS NOT NULL
GROUP BY Color, Class;

--12.	  
SELECT c.Name AS Country, s.Name AS Province 
FROM Person.CountryRegion c 
JOIN
Person.StateProvince s
ON c.CountryRegionCode = s.CountryRegionCode;

--13.
SELECT c.Name AS Country, s.Name AS Province 
FROM Person.CountryRegion c 
JOIN
Person.StateProvince s
ON c.CountryRegionCode = s.CountryRegionCode
WHERE c.Name NOT IN ('Germany', 'Canada');	

--14.
USE Northwind
GO

SELECT DISTINCT p.ProductID, p.ProductName
FROM Orders as o
JOIN
[Order Details] od
ON o.OrderID =  od.OrderID
JOIN 
Products p
ON od.ProductID = p.ProductID
WHERE DATEDIFF(year, o.OrderDate, GETDATE()) < 25;

--15.	
SELECT TOP 5 o.ShipPostalCode, SUM(od.Quantity) as qty FROM 
Orders o
JOIN
[Order Details] od
ON o.OrderID =  od.OrderID
WHERE o.ShipPostalCode IS NOT NULL
GROUP BY ShipPostalCode
ORDER BY qty DESC;

--16.	
SELECT TOP 5 o.ShipPostalCode, SUM(od.Quantity) Qty FROM Orders o
JOIN
[Order Details] od
ON o.OrderID =  od.OrderID
WHERE o.ShipPostalCode IS NOT NULL 
	AND DATEDIFF(year, o.OrderDate, GETDATE())< 25
GROUP BY ShipPostalCode
ORDER BY Qty DESC;

--17.
SELECT City, count(customerID) as NumOfCustomer
from customers
group by City

--18.
SELECT City, count(customerID) as NumOfCustomer
from customers
group by City
HAVING  count(customerID)>2



--19.
SELECT DISTINCT c.CustomerID, c.CompanyName, c.ContactName FROM Orders o
INNER JOIN 
Customers c
ON o.CustomerID = c.CustomerID
WHERE OrderDate > '1998-1-1';

--20.
SELECT c.ContactName, MAX(o.OrderDate) AS MostRecentOrderDate
FROM Customers c LEFT JOIN Orders o ON c.CustomerId = o.CustomerId
GROUP BY c.ContactName

--21.
SELECT c.CustomerID, c.CompanyName, c.ContactName, 
SUM(od.Quantity) Qty FROM Customers c 
LEFT JOIN 
Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN 
[Order Details] od
ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName, c.ContactName
ORDER BY Qty;

--22
SELECT c.CustomerID,
SUM(od.Quantity) AS Qty FROM Customers c LEFT JOIN Orders o 
ON c.CustomerID = o.CustomerID
LEFT JOIN 
[Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID
HAVING SUM(od.Quantity) > 100
ORDER BY Qty;

--23.
SELECT Supp.CompanyName, Shipr.CompanyName
FROM Suppliers Supp CROSS JOIN Shippers Shipr
Order By 2, 1

--24.	
SELECT o.OrderDate, p.ProductName FROM 
Orders o
LEFT JOIN
[Order Details] od
ON o.OrderID = od.OrderID
INNER JOIN
Products p
ON od.ProductID = p.ProductID
GROUP BY o.OrderDate, p.ProductName
ORDER BY o.OrderDate;

--25.
--(i)	
SELECT Title, LastName + ' ' + FirstName AS FullName 
FROM Employees
ORDER BY Title;

--(ii)
SELECT emp1.Title, emp1.LastName + ' ' + emp1.FirstName AS Name1, emp2.LastName + ' ' + emp2.FirstName AS FullName2 
FROM Employees emp1
JOIN 
Employees emp2
ON emp1.Title = emp2.Title 
WHERE emp1.FirstName != emp2.FirstName OR emp1.LastName != emp2.LastName
ORDER BY Title;

--26.
SELECT Emps1.EmployeeId, Emps1.LastName, Emps1.FirstName,Emps2.ReportsTo, COUNT(Emps2.ReportsTo) AS Subordinate  
FROM Employees Emps1 JOIN Employees Emps2 ON Emps1.EmployeeId = Emps2.ReportsTo
WHERE Emps2.ReportsTo IS NOT NULL
GROUP BY Emps1.EmployeeId, Emps1.LastName, Emps1.FirstName,Emps2.ReportsTo
HAVING COUNT(Emps2.ReportsTo) > 2

--27.
SELECT c.City, c.CompanyName, c.ContactName, 'Customer' as Type
FROM Customers c
UNION
SELECT s.City, s.CompanyName, s.ContactName, 'Supplier' as Type
FROM Suppliers s;


