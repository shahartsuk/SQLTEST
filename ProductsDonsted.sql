select c.Hashtag,p.ID,p.ProductName,p.UnitPrice,p.Amount from Products p inner join Campaigns C
on p.CampaignID = c.ID
order by c.ID

select * from Products
select * from Purchases