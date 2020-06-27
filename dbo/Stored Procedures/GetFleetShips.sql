-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/15/2020
-- Description:	Get Planet
-- =============================================
CREATE PROCEDURE [dbo].[GetFleetShips] 
	@FleetID int 
AS
BEGIN
	SELECT 
		fd.[FleetDetailID]
		,fd.[FleetID]
		,fd.[DesignID]
		,sd.DesignName
		,fd.[ActualNumber]
		,fd.[EffectiveNumber]
		,fd.[UserID]
		,fd.Movement
		,sd.Colony
		,h.Hull
	FROM [dbo].[FleetDetails] fd
	JOIN dbo.ShipDesigns sd on sd.ShipDesignID = fd.DesignID
	JOIN dbo.Hulls h on h.HullID = sd.HullID
	WHERE fd.FleetID = @FleetID
END