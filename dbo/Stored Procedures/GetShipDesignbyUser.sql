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
		sd.ShipDesignID,
		sd.UserID,
		sd.DesignName,
		sd.HullID,	
		h.HullName	
	FROM dbo.ShipDesigns sd
	JOIN dbo.Hulls h ON h.HullID = sd.HullID
	WHERE sd.UserID = @UserID
 
END