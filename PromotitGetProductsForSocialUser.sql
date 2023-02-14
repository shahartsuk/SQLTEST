select po.ID,pu.Amount,po.ProductName,po.UnitPrice,pu.IsKeeping from Purchases pu inner join Products po
on pu.ProductID = po.ID
where pu.ActivistID = 1
order by pu.IsKeeping