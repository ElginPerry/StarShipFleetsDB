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
	FROM [dbo].[FleetDetails] fd
	JOIN dbo.ShipDesigns sd on sd.ShipDesignID = fd.DesignID
	WHERE fd.FleetID = @FleetID
END