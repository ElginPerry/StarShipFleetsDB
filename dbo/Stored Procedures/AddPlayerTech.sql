-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/27/2020
-- Description:	[Add Player Tech]
-- =============================================
CREATE PROCEDURE [dbo].[AddPlayerTech]
	@UserID int,
	@TechID int	
AS
BEGIN
Declare @TechLevel int

SELECT @TechLevel = TechLevel
FROM [dbo].PlayerTechnology
WHERE UserID = @UserID
AND TechID = @TechID

	IF @TechLevel is null	
	BEGIN
		INSERT INTO [dbo].PlayerTechnology
			   (UserID
			   ,TechID
			   ,TechLevel)
		 VALUES
			   (@UserID
			   ,@TechID
			   ,1)
	END
	ELSE
	BEGIN
		UPDATE [dbo].PlayerTechnology
			SET [TechLevel] = [TechLevel] + 1
			WHERE TechID = @TechID
			AND UserID = @UserID
	END
END