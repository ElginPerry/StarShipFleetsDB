-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/28/2020
-- Description:	Get Ship Design
-- =============================================
CREATE PROCEDURE [dbo].[GetShipDesignSummary] 
	@ShipDesignID int
AS
BEGIN
	SELECT 
		sd.[ShipDesignID]
		,sd.[DesignName]
		,h.HullName	
		,h.Hull
		,sd.[ShipYardLevel]
		,sd.[MaterialCost]
		,sd.[MilitaryCost]
		,sd.Energy
		,sd.EnergyCost
		,sd.[Laser]
		,sd.[Missile]
		,sd.[Plasma]
		,sd.[Shields]
		,sd.[Armor]
		,sd.[Bays]
		,sd.[Movement]	
		,sd.[Colony]	
	FROM dbo.ShipDesigns sd
	JOIN dbo.Hulls h ON h.HullID = sd.HullID
	WHERE sd.ShipDesignID = @ShipDesignID
END