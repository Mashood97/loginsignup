Create database loginSignup

use loginSignup



Create table signupUser(
userId int primary key identity(1,1),
userEmail nvarchar(50),
userPassword nvarchar(50)
);






truncate table signupUser
Alter table signupUser
Alter Column userPassword nvarchar(max)

Alter proc spSignupUser
@userEmail nvarchar(50),
@userPassword nvarchar(max),
@responseMessage varchar(50) output

as
begin
	set nocount on;

	begin try

	IF EXISTS (Select userEmail from signupUser where userEmail = @userEmail)
		BEGIN
			set @responseMessage = 'Failed';
		END
	ELSE
		BEGIN
			Insert into signupUser 
	Output Inserted.userId,@userEmail as Email,@userPassword as Password
	values(@userEmail,@userPassword);
	
	set @responseMessage = 'Success';
		END
	end try
	begin catch
		set @responseMessage = ERROR_MESSAGE();
	end catch
end


Declare @userEmail nvarchar(50), @userPassword nvarchar(50),@responseMessage varchar(50)
Exec spSignupUser @userEmail='mashood21@gmail.com',@userPassword = '$2b$10$fZe7hjws5AzGUa5J0yj2Le1fLAf3oV5SAEee3nneu4VUGEsVIAf82',@responseMessage = @responseMessage output
print @responseMessage;

Select * from signupUser


Truncate table signupUser;
