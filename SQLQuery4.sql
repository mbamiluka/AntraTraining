
--1
CREATE VIEW view_product_order_Luka
AS
SELECT ProductName,SUM(Quantity) OrderedQty FROM [Order Details] OD JOIN Products P ON P.ProductID = OD.ProductID
GROUP BY ProductName

--2

ALTER PROC sp_product_order_quantity_Luka
@ProductID INT,
@OrderedQty INT OUT
AS
BEGIN
SELECT @OrderedQty = SUM(Quantity)  FROM [Order Details] OD JOIN Products P ON P.ProductID = OD.ProductID
WHERE P.ProductID = @ProductID
END



DECLARE @Tot INT
EXEC sp_product_order_quantity_Luka 11,@Tot OUT
PRINT @Tot 

--3
ALTER PROC sp_product_order_city_Luka
@ProductName NVARCHAR(50)
AS
BEGIN
SELECT TOP 5 ShipCity,SUM(Quantity) FROM [Order Details] OD JOIN Products P ON P.ProductID = OD.ProductID JOIN Orders O ON O.OrderID = OD.OrderID
WHERE ProductName=@ProductName
GROUP BY ProductName,ShipCity
ORDER BY SUM(Quantity) DESC
END


EXEC sp_Product_Order_City_Luka 'Queso Cabrales'


--4
CREATE TABLE people_Luka
(
id int ,
name nvarchar(100),
city int
)

create table city_Luka
(
id int,
city nvarchar(100)
)
BEGIN TRAN 
insert into city_Luka values(1,'Seattle')
insert into city_Luka values(2,'Green Bay')

insert into people_Luka values(1,'Aaron Rodgers',1)
insert into people_Luka values(2,'Russell Wilson',2)
insert into people_Luka values(3,'Jody Nelson',2)

if exists(select id from PeopleLuka WHERE city = (select id from city_Luka WHERE city = 'Seatle'))
begin
insert into city_Luka values(3,'Madison')
update PeopleLuka
set city = 'Madison'
WHERE id in (select id from PeopleLuka WHERE city = (select id from city_Luka WHERE city = 'Seatle'))
end
delete from city_Luka WHERE city = 'Seattle'

CREATE VIEW Packers_Luka
AS
SELECT name FROM people_Luka WHERE city = 'Green Bay'

select * from Packers_Luka
commit
DROP table peopleLuka
DROP table city_Luka
DROP view Packers_Luka

-- 5

ALTER PROC sp_birthday_employee_Luka
AS
BEGIN
SELECT * INTO #EmployeeTemp
FROM Employees WHERE DATEPART(MM,BirthDate) = 02
SELECT * FROM #EmployeeTemp
END



--6
SELECT * FROM Customers
EXCEPT
SELECT * FROM Customers
