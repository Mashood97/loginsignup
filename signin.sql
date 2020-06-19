

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




