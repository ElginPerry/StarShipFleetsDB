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
		sd.ShipDesignID,
		sd.DesignName,		
		h.HullName,
		h.Hull,
		sum(sp.Armor*sdp.NumofPods) as Armor,
		sum(sp.MilitaryCost*sdp.NumofPods) as MilitaryCost,
		sum(sp.Laser*sdp.NumofPods) as Laser,
		sum(sp.MaterialCost*sdp.NumofPods) as MaterialCost,
		sum(sp.Missile*sdp.NumofPods) as Missile,
		sum(sp.Movement*sdp.NumofPods) as Movement,
		sum(sp.Plasma*sdp.NumofPods) as Plasma,
		sum(sp.Shields*sdp.NumofPods) as Shields				
	FROM dbo.ShipDesigns sd
	JOIN dbo.ShipDesignsPods sdp ON sdp.ShipDesignID = sd.ShipDesignID
	JOIN dbo.ShipPods sp ON sp.ShipPodID=sdp.ShipDesignPodsID
	JOIN dbo.Hulls h ON h.HullID = sd.HullID
	WHERE sd.ShipDesignID = @ShipDesignID
	GROUP BY 
		sd.ShipDesignID,
		sd.DesignName,		
		h.HullName,
		h.Hull 
END