﻿-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/15/2020
-- Description:	Get Planet
-- =============================================
CREATE PROCEDURE [dbo].[AddFleetDetails] 
	@UserID int,
	@FleetID int,
	@DesignID int,
	@ActualNumber int,
	@EffectiveNumber float
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
	END
	ELSE
	BEGIN	
		INSERT INTO [dbo].[FleetDetails]
			([FleetID]
			,[DesignID]
			,[ActualNumber]
			,[EffectiveNumber]
			,[UserID])
		VALUES
			(@FleetID,
			@DesignID,
			@ActualNumber,
			@EffectiveNumber,
			@UserID)
	END

END