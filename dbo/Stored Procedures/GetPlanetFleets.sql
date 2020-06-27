-- =============================================
-- Author:		Elgin Perry
-- Create date: 6/15/2020
-- Description:	Get Planet Fleets
-- =============================================
CREATE PROCEDURE [dbo].[GetPlanetFleets] 
	@UserID int,
	@PlanetID int = 1273
AS
BEGIN
	SELECT	
	f.UserID,
	f.FleetID,
	f.FleetName,
	f.Status,
	f.Destination,
	f.Start,
	f.Arrival,
	sum(sd.MaterialCost * fd.EffectiveNumber) as MaterialCost,
	p.PlanetID,
	p.System,
	p.Sector,
	p.Galaxy,
	p.XSysPosition,
	p.YSysPosition
	FROM dbo.Planets p
	JOIN dbo.Fleets f on f.PlanetID = p.PlanetID
	JOIN dbo.FleetDetails fd on fd.FleetID = f.FleetID
	JOIN dbo.ShipDesigns sd on sd.ShipDesignID = fd.DesignID
	WHERE f.Destination = @PlanetID 
	GROUP BY
	f.UserID,
	f.FleetID,
	f.FleetName,
	f.Status,
	f.Destination,
	f.Start,
	f.Arrival,
	--add total Material Cost 	
	p.PlanetID,
	p.System,
	p.Sector,
	p.Galaxy,
	p.XSysPosition,
	p.YSysPosition
	ORDER BY f.Arrival
END