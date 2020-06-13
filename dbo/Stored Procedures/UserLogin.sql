-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/6/2020
-- Description:	User Login
-- =============================================
CREATE PROCEDURE [dbo].[UserLogin]
	@UserEmail nvarchar(100),
	@Password nvarchar(50)
AS
BEGIN
	DECLARE @USERID int
	SELECT @USERID = UserID
	FROM dbo.Users u
	WHERE u.UserEmail = @UserEmail
	AND u.Password = @Password

	IF @USERID is not null
	BEGIN
		UPDATE dbo.Users
		Set LastLogin = GetDate()	
		WHERE UserID = @USERID

		SELECT UserID
		,UserEmail
		,Password
		,Premium
		,PremiumExpires
		,LastLogin
		,IPAddress
		,Joined
		,Banned
		FROM dbo.Users
		WHERE UserID = @USERID
	END
END