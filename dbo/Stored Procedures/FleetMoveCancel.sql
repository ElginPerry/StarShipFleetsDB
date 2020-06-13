-- =============================================
-- Author:		Elgin Perry
-- Create date: 6/12/2020
-- Description:	Arrival Fleet
-- =============================================
CREATE PROCEDURE [dbo].[FleetMoveCancel] 
	@FleetID int
AS
BEGIN
	UPDATE dbo.Fleets
	SET Destination = PlanetID,
	Arrival = DATEDIFF(second, Start, GETUTCDATE()),
	Start = GETUTCDATE()
	Where FleetID = @FleetID
END