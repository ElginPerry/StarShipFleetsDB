-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/29/2020
-- Description:	[ADD Ship Designs]
-- =============================================
CREATE PROCEDURE [dbo].[RemoveShipDesigns] 
	@UserID int,
	@ShipDesignID int
AS
BEGIN
   IF EXISTS (
        SELECT ShipDesignID
		FROM [dbo].[ShipDesigns]
		WHERE ShipDesignID = @ShipDesignID
		AND UserID = @UserID
    )
	BEGIN

	DELETE FROM
		[dbo].[ShipDesigns]
		WHERE ShipDesignID = @ShipDesignID

	DELETE FROM 
		dbo.ShipDesignsPods
		WHERE ShipDesignID = @ShipDesignID
		
	END

END