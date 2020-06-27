-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/15/2020
-- Description:	Get Planet
-- =============================================
CREATE PROCEDURE [dbo].[GetFleets] 
	@UserID int = null,
	@PlanetID int = null,
	@FleetID int = null,
	@System nvarchar(5) = null
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
	WHERE (f.UserID = @UserID OR @UserID is null)
	AND (f.PlanetID = @PlanetID OR @PlanetID is null)
	AND (f.FleetID = @FleetID OR @FleetID is null)
	AND (p.System = @System OR @System is null)
	GROUP BY
	f.UserID,
	f.FleetID,
	f.FleetName,
	f.Status,
	f.Destination,
	f.Start,
	f.Arrival,	
	p.PlanetID,
	p.System,
	p.Sector,
	p.Galaxy,
	p.XSysPosition,
	p.YSysPosition
	ORDER BY f.Arrival
END