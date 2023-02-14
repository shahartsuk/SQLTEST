declare @activist_id int=1 ,
@product_id int =1,
@is_keeping bit =1,
@amount int =5

if not exists(select * from Purchases where ActivistID = @activist_id and ProductID = @product_id)
begin
insert into Purchases values(@activist_id,@product_id,@is_keeping,@amount)
update Products set Amount = (Amount - @amount) where ID = @product_id
end
else
begin
update Purchases set ActivistID = @activist_id,ProductID= @product_id,IsKeeping =0,
Amount=(Amount + @amount)
where ActivistID = @activist_id
update Products set Amount = Amount - @amount  where ID = @product_id
end


select Amount from Purchases where (ProductID = @product_id)
 select @activist_id

select * from Users
select * from Products
select * from Purchases