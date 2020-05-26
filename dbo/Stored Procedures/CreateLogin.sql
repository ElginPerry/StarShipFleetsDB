-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/6/2020
-- Description:	Create Login
-- =============================================
CREATE PROCEDURE CreateLogin
	@UserEmail nvarchar(100),
	@Password nvarchar(50)
AS
BEGIN
	DECLARE @USERID int
	SELECT @USERID = UserID
	FROM dbo.Users u
	WHERE u.UserEmail = @UserEmail
	
	IF @USERID is null
	BEGIN
		INSERT INTO dbo.Users
		VALUES
		(
			@UserEmail
			,@Password
			,0
			,null
			,GetDate()
			,null
			,GetDate()	
		)

		SELECT UserID
		,UserEmail
		,Password
		,Premium
		,PremiumExpires
		,LastLogin
		,IPAddress
		,Joined
		FROM dbo.Users
		WHERE UserEmail = @UserEmail
	END
END