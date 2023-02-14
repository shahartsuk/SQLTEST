declare @id int,
@name nvarChar(30)='avi',
@email nvarChar(40)='fwer',
@role nvarChar(40)='gever',
@adress nvarChar(50),
@phone nvarChar(15),
@link nvarChar(70)='efbe'
if exists(select ID from Users where (Email = @email and Role = @role) and (Adress like '%' or Link like '%'))
begin
select @id=0
end 
else
begin
if not exists (select * from Users where Email = @email and Role = @role)
begin
insert into Users (Name,Email,Role) values (@name,@email,@role)
select @id = @@IDENTITY
end
else
begin
select @id = (select ID from Users where Email = @email and Role = @role)
end
end
select @id
select * from Users

--delete from Users where ID = 2
--update Users set Adress = 'dcdcd' where ID=10