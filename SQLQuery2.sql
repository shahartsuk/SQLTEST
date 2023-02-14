--העובד מכניס מספר זהות וסיסמא

--1. הצהרה על משתנים
declare @id nvarChar(10) ='1345',
@temp_password nvarChar(12),
@answer nvarChar(100),
@employee_code int,
@password nvarChar(20) ='2345'

if exists(select E.Code from Employee E inner join Passwords P
on E.Code = P.Employee_code  where @id=ID or (@password = Password
and P.Is_active=1))
begin --1
select @employee_code =@@IDENTITY 


if exists(select* from Passwords where Expiry >= getdate())
  begin --2
select @answer ='הסיסמא שלך לא בתוקף נא להחליף לסיסמא חדשה'
  end --2

   else
     begin --3

     if exists (select * from times where Exit_time is null)
       begin --4
		
		insert into times values(@employee_code,(convert(nvarChar(20),getdate(),103)+' '+convert(nvarChar(20),getdate(),108)),null) 
		select @answer = 'ברוך הבא, שעת הכניסה היא'+(convert(nvarChar(20),getdate(),103)+' '+convert(nvarChar(20),getdate(),108))
		end --4
			else
			begin --5
			update times set Exit_time = (convert(nvarChar(20),getdate(),103)+' '+convert(nvarChar(20),getdate(),108)) where Employee_code = @employee_code 
			and Exit_time is null
			select @answer ='להתראות שעת היציאה היא'+(convert(nvarChar(20),getdate(),103)+' '+convert(nvarChar(20),getdate(),108))
			end --5
	end --3


end --1

else 
begin --5
select @answer = 'השם משתמש או הסיסמא לא נכונים'
end --5

select @answer

--להביא תאריך
--select convert(nvarChar(20),getdate(),103)
--להביא שעון
--select convert(nvarChar(20),getdate(),108)+' '+
--select E.ID,E.First_name,E.Last_name,T.Entry_time,Exit_time from Employee E,times T 
--2.בדיקה על מספר זהות אם קיים
--4. אם קיים, בדיקה על הסיסמא אם קיימת לעובד ובתוקף
--3. אם לא קיים,תשובה שלילית -שאלה שלישית
--5. אם לא-תשובה שלילית - שאלה שלישית
--6. אם נכונה הסיסמא,בדיקה על התאריך שלה שלא עבר התוקף
--7.אם עבר התוקף,החלפת סיסמא -שאלה רביעית
--8.בדיקה האם העובד הגיע עכשיו לעבודה או יוצא ממנה
--9.אם הגיע מכניס שעת כניסה ומחזיר תשובה ראשונה
--10.ELSE מכניס שעת יציאה בשורה המתאימה ומחזיר תשובה שניה