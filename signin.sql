

Alter proc spSignInUser
@userEmail nvarchar(50),
@userPassword nvarchar(max),
@responseMessage varchar(50) output

as 
begin
	set nocount on;
	begin try
IF EXISTS (Select userEmail,userPassword from signupUser where userEmail = @userEmail and userPassword = @userPassword)
	begin 
		Select userEmail,userPassword from signupUser where userEmail = @userEmail and userPassword = @userPassword
		set @responseMessage = 'Success';
	end
else
	begin 
		set @responseMessage = 'Auth Failed';
	end
	end try

	begin catch
	set @responseMessage = 'Failed'
	 end catch
end


Declare @userEmail nvarchar(50), @userPassword nvarchar(max), @responseMessage varchar(50)
EXEC spSignInUser @userEmail = 'mashood1@gmail.com',@userPassword='Passwords', @responseMessage = @responseMessage output
print @responseMessage




alter proc spUserInfo
@token nvarchar(max),
@responseMessage varchar(50) output,
@userId int,
@SelectedDate datetime
as 

begin
	set nocount on;


	begin try
	IF EXISTS (Select userEmail,userPassword from signupUser where userId = @userId)
	begin 
	Select * from signupUser where @token is not null and userId = @userId;
		set @responseMessage = 'Success';
	end
	else
	set @responseMessage= 'Failed'
		
	end try

	begin catch
		set @responseMessage = 'failed';
	end catch
end

Declare @token nvarchar(max),@userId int, @responseMessage varchar(50)
EXEC spUserInfo @userId = 5, @token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1hc2hvb2RzaWRkMTIyMUBnbWFpbC5jb20iLCJ1c2VySWQiOjEsImlhdCI6MTU5MjQ3MjE1NCwiZXhwIjoxNTkyNDc1NzU0fQ.CeAKShsTRM-bLS0PlMXeRvgX43c2qaDGYWFLZEe-vbE', @responseMessage = @responseMessage output
print @responseMessage



