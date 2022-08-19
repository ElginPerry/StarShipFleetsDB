-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/15/2020
-- Description:	Update Fleet Details
-- =============================================
CREATE PROCEDURE [dbo].[UpdateFleetDetails] 
	@UserID int,
	@FleetID int,
	@DesignID int,
	@ActualNumber int,
	@EffectiveNumber float,
	@Movement float
AS
BEGIN

	IF EXISTS(
		SELECT FleetDetailID
		FROM dbo.FleetDetails
		WHERE DesignID = @DesignID
		AND FleetID = @FleetID)
	BEGIN
		UPDATE dbo.FleetDetails
		SET ActualNumber = ActualNumber+@ActualNumber,
			EffectiveNumber = EffectiveNumber+@EffectiveNumber
		WHERE DesignID = @DesignID
		AND FleetID = @FleetID
	END
	ELSE
	BEGIN	
		INSERT INTO [dbo].[FleetDetails]
			([FleetID]
			,[DesignID]
			,[ActualNumber]
			,[EffectiveNumber]
			,[UserID]
			,[Movement])
		VALUES
			(@FleetID,
			@DesignID,
			@ActualNumber,
			@EffectiveNumber,
			@UserID,
			@Movement)
	END

END