-- =============================================
-- Author:		Elgin Perry
-- Create date: 6/12/2020
-- Description:	Set Move Fleet
-- =============================================
CREATE PROCEDURE [dbo].[SetMoveFleet] 
	@UserID int,
	@FleetID int,
	@PlanetID int
AS
BEGIN
	DECLARE @FleetPlanet int, @FX float, @FY float, @PX float, @PY float, @Movement float, @Dis float, @Seconds float

	SELECT 
		@PX = p.XSysPosition,
		@PY = p.YSysPosition,
		@FX = d.XSysPosition,
		@FY = d.YSysPosition
		FROM dbo.Planets p
		JOIN dbo.Fleets f ON f.FleetID = @FleetID
		JOIN dbo.planets d ON d.PlanetID= f.PlanetID
		WHERE 
		p.PlanetID = @PlanetID

	SELECT
		@Movement = MIN(fd.Movement)
	FROM dbo.FleetDetails fd
	JOIN dbo.ShipDesigns sd on sd.ShipDesignID = fd.DesignID
	JOIN dbo.Hulls h on h.HullID=sd.HullID
	WHERE fd.FleetID = @FleetID
	AND sd.UserID = @UserID
	AND h.Hull >= 500

	SELECT @Dis = SQRT( SQUARE(@PX-@FX) + SQUARE(@PY-@FY))

	SET @Seconds = ROUND(@Dis/@Movement,0)
	IF @Seconds < 30
	BEGIN
		SET @Seconds = 30
	END

	UPDATE dbo.Fleets
	SET Destination = @PlanetID,
		Status = 1,
		Arrival = DATEADD (ss, @Seconds, GETUTCDATE()),
		Start = GETUTCDATE()
	WHERE FleetID = @FleetID
END