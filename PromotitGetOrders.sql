select Users.ID,Users.Name,
Users.Email,Users.Adress,Users.PhoneNumber,
Purchases.Amount,
Products.ProductName,Products.UnitPrice,Products.Amount,
Purchases.ID
from Products inner join Purchases 
on Products.ID = Purchases.ProductID 
inner join Users on Purchases.ActivistID = Users.ID
where Products.SupplierID = 5 and Purchases.IsKeeping = 0
Order by Purchases.ActivistID,Products.CampaignID

select * from Users

--update Users set Adress= 'shazoor', PhoneNumber='0756654678'
update Purchases set IsKeeping = 0
select * from Purchases

