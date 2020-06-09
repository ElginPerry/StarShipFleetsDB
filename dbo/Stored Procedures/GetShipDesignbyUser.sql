-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/28/2020
-- Description:	Get User Design
-- =============================================
CREATE PROCEDURE [dbo].[GetShipDesignbyUser] 
	@UserID int
AS
BEGIN
	SELECT 
		sd.[ShipDesignID]
		,sd.[UserID]
		,sd.[DesignName]
		,sd.[HullID]
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
		,h.HullName	
	FROM dbo.ShipDesigns sd
	JOIN dbo.Hulls h ON h.HullID = sd.HullID
	WHERE sd.UserID = @UserID
 
END