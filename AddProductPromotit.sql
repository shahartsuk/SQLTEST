declare
@unit_price money =12,
@supplier_id int =5,
@campaign_id int =2,
@amount int =113,
@product_name nvarchar(30) ='bamba'
if not exists (select * from Products where CampaignID = @campaign_id and SupplierID = @supplier_id and ProductName like @product_name)
begin 
insert into Products values(@product_name,@unit_price,@amount,@supplier_id,@campaign_id)
end
else
begin
update Products set ProductName = @product_name, UnitPrice = @unit_price,
SupplierID = @supplier_id,CampaignID=@campaign_id,Amount=@amount
where CampaignID = @campaign_id and SupplierID = @supplier_id and ProductName like @product_name
end


select * from Products
select * from Campaigns
--select * from Users
