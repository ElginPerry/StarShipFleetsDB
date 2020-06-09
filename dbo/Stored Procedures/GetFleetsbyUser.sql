-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/15/2020
-- Description:	Get Planet
-- =============================================
CREATE PROCEDURE [dbo].[GetFleetsbyUser] 
	@UserID int,
	@PlanetID int = null,
	@FleetID int = null
AS
BEGIN
	SELECT	
	f.UserID,
	f.FleetID,
	f.FleetName,
	f.Status,
	f.Destination,
	f.Arrival,
	p.PlanetID,
	p.System,
	p.Sector,
	p.Galaxy
	FROM dbo.Planets p
	JOIN dbo.Fleets f on f.PlanetID = p.PlanetID
	WHERE f.UserID = @UserID
	AND (f.PlanetID = @PlanetID OR @PlanetID is null)
	AND (f.FleetID = @FleetID OR @FleetID is null)
END