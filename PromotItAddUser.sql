declare @id int,
if not exists(select * from Users where Email = @email and Role = @role)
begin
insert into Users values (@name,@email,@role,@adress,@phone,@link,@money)
select @id=@@IDENTITY
end
else
begin
update Users set Name=@name,Email = @email,Role=@role,Link=@link 
where Email = @email and Role = @role
select @id=(select ID from Users where Email = @email and Role = @role) 
end
select @id

delete from Users
select * from Users