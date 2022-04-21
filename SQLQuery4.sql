
--1
CREATE VIEW View_Product_Order_Luka
AS
SELECT ProductName,SUM(Quantity) As TotalOrderQty FROM [Order Details] OD JOIN Products P ON P.ProductID = OD.ProductID
GROUP BY ProductName

--2

ALTER PROC sp_Product_Order_QuantityLuka
@ProductID INT,
@TotalOrderQty INT OUT
AS
BEGIN
SELECT @TotalOrderQty = SUM(Quantity)  FROM [Order Details] OD JOIN Products P ON P.ProductID = OD.ProductID
WHERE P.ProductID = @ProductID
END



DECLARE @Tot INT
EXEC sp_Product_Order_QuantityLuka 11,@Tot OUT
PRINT @Tot 

--3
ALTER PROC sp_Product_Order_CityLuka
@ProductName NVARCHAR(50)
AS
BEGIN
SELECT TOP 5 ShipCity,SUM(Quantity) FROM [Order Details] OD JOIN Products P ON P.ProductID = OD.ProductID JOIN Orders O ON O.OrderID = OD.OrderID
WHERE ProductName=@ProductName
GROUP BY ProductName,ShipCity
ORDER BY SUM(Quantity) DESC
END


EXEC sp_Product_Order_CityLuka 'Queso Cabrales'


--4
CREATE TABLE PeopleLuka
(
id int ,
name nvarchar(100),
city int
)

create table CityLuka
(
id int,
city nvarchar(100)
)
BEGIN TRAN 
insert into CityLuka values(1,'Seattle')
insert into CityLuka values(2,'Green Bay')

insert into PeopleLuka values(1,'Aaron Rodgers',1)
insert into PeopleLuka values(2,'Russell Wilson',2)
insert into PeopleLuka values(3,'Jody Nelson',2)

if exists(select id from PeopleLuka where city = (select id from CityLuka where city = 'Seatle'))
begin
insert into CityLuka values(3,'Madison')
update PeopleLuka
set city = 'Madison'
where id in (select id from PeopleLuka where city = (select id from CityLuka where city = 'Seatle'))
end
delete from CityLuka where city = 'Seattle'

CREATE VIEW PackersLuka
AS
SELECT name FROM PeopleLuka WHERE city = 'Green Bay'

select * from PackersLuka
commit
DROP table PeopleLuka
DROP table CityLuka
DROP view PackersLuka

-- 5

ALTER PROC sp_birthday_employeeLuka
AS
BEGIN
SELECT * INTO #EmployeeTemp
FROM Employees WHERE DATEPART(MM,BirthDate) = 02
SELECT * FROM #EmployeeTemp
END



--6 USE EXCEPT KEYWORD

SELECT * FROM Customers
EXCEPT
SELECT * FROM Customers

--7 SELECT firstName+' '+lastName from Person where middleName is null UNION SELECT firstName+' '+lastName+' '+middelName+'.' from Person where middleName is not null

--8 select top 1 marks from student where sex = 'F' order by marks desc

--9 select * from students order by sex,marks
