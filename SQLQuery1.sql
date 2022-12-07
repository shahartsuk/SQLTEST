select * from Products where UnitPrice > 30 and UnitPrice < 40

--------------------------------------------------1

select * from Products tbl1 inner join Categories tbl2
on tbl1.CategoryID = tbl2.CategoryID where CategoryName like 'Condiments'

-----------------------------------------------------2

select * from Products tbl1 inner join Categories tbl2
on tbl1.CategoryID = tbl2.CategoryID where tbl2.[Description] like '%S%'

-------------------------------------------------------3

select distinct ProductName from Orders O inner join Customers C
on C.CustomerID = O.CustomerID inner join [Order Details] OD on
OD.OrderID = O.OrderID inner join Products P on
OD.ProductID = P.ProductID where C.CustomerID like 'ALFKI'

--------------------------------------------------4

select * from Orders where  ShipCity like 'London' or 
ShipCountry like 'Brazil'

------------------------------------------------5

select C.CustomerID from Orders O inner join Shippers S
on O.ShipVia = S.ShipperID inner join Customers C
on C.CustomerID = O.CustomerID where S.CompanyName like 'Federal Shipping'

------------------------------------------------6

alter procedure ProductNames 
@OrderNum int 
as begin 
select ProductName from [Order Details] OD inner join Products P
on P.ProductID = OD.ProductID where OD.OrderID = @OrderNum

select SUM(UnitPrice) from [Order Details]
where [Order Details].OrderID = @OrderNum
end 
--exec ProductNames @OrderNum = 10248

-------------------------------------7

select
[CustomerID],[EmployeeID],[ShipVia],[Freight],[ShipName],
[ShipAddress],[ShipCity],[ShipRegion],[ShipPostalCode],[ShipCountry]
from Orders
where ShipVia = 1 and (EmployeeID = 2 or EmployeeID = 5) and (CustomerID like 'B%')

--------------------------------------8

select OD.*,O.OrderDate,O.EmployeeID,O.CustomerID from [Order Details] OD inner join Orders O
on O.OrderID = OD.OrderID OR O.OrderID != OD.OrderID
where OD.OrderID = 10248 and O.CustomerID like 'VINET'
order by UnitPrice,O.EmployeeID

-----------------------------------9

select CustomerID,Region,Country from Customers 
where Country like 'France' or Country like 'Canada'

-------------------------------10 

select OD.*,O.OrderDate,O.EmployeeID,O.CustomerID from [Order Details] OD,Orders O
where OD.OrderID = 10248 and O.CustomerID like 'VINET'
order by UnitPrice,O.EmployeeID

----------------------------- another example to exe 9