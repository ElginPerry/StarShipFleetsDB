-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/22/2020
-- Description:	[Add Ship Design Pods]
-- =============================================
CREATE PROCEDURE [dbo].[AddShipDesignPods]
	@ShipDesignID int,
	@PodID int,
	@NumofPods int
AS
BEGIN

   IF EXISTS (
        SELECT ShipDesignPodsID
		FROM [dbo].[ShipDesignsPods]
		WHERE ShipDesignID = @ShipDesignID
		AND PodID = @PodID
    )
	BEGIN
		UPDATE [dbo].[ShipDesignsPods]
		SET NumofPods = NumofPods + @NumofPods
		WHERE ShipDesignID = @ShipDesignID
		AND PodID = @PodID

	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[ShipDesignsPods]
           ([ShipDesignID]
           ,[PodID]
           ,[NumofPods])
		VALUES
           (@ShipDesignID,
			@PodID,
			@NumofPods)
	END
END