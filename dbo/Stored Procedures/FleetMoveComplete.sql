-- =============================================
-- Author:		Elgin Perry
-- Create date: 6/12/2020
-- Description:	Arrival Fleet
-- =============================================
CREATE PROCEDURE [dbo].[FleetMoveComplete] 
AS
BEGIN
	UPDATE dbo.Fleets
	SET PlanetID = Destination,
	Status = 0,
	Start = null
	Where Status = 1
	AND
	Arrival <= GETUTCDATE()
END