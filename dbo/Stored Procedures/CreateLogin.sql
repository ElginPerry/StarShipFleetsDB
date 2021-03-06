﻿-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/6/2020
-- Description:	Create Login
-- =============================================
CREATE PROCEDURE [dbo].[CreateLogin]
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
			,GetUTCDate()
			,GetUTCDate()
			,null
			,GetUTCDate()
			,0	
		)

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
		WHERE UserEmail = @UserEmail
	END
END