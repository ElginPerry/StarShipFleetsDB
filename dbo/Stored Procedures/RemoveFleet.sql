-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/15/2020
-- Description:	Remove Fleet 
-- =============================================
CREATE PROCEDURE [dbo].[RemoveFleet] 
	@UserID int,
	@FleetID int
AS
BEGIN
	DELETE FROM dbo.FleetDetails
	WHERE FleetID = @FleetID
	AND UserID = @UserID

	DELETE FROM dbo.Fleets
	WHERE FleetID = @FleetID
	AND UserID = @UserID
END