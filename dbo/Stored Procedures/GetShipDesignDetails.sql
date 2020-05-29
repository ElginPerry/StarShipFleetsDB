-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/28/2020
-- Description:	Get Ship Design
-- =============================================
CREATE PROCEDURE [dbo].[GetShipDesignDetails] 
	@ShipDesignID int
AS
BEGIN
	SELECT 
		sd.ShipDesignID,
		sd.DesignName,		
		h.HullName,
		h.Hull,
		sdp.NumofPods,
		sp.ShipPodID,
		sp.PodName,
		sp.Armor,
		sp.Energy,
		sp.EnergyCost,
		sp.MilitaryCost,
		sp.Laser,
		sp.MaterialCost,
		sp.Missile,
		sp.Movement,
		sp.Plasma,
		sp.Shields				
	FROM dbo.ShipDesigns sd
	JOIN dbo.ShipDesignsPods sdp ON sdp.ShipDesignID = sd.ShipDesignID
	JOIN dbo.ShipPods sp ON sp.ShipPodID=sdp.ShipDesignPodsID
	JOIN dbo.Hulls h ON h.HullID = sd.HullID
	WHERE sd.ShipDesignID = @ShipDesignID
 
END