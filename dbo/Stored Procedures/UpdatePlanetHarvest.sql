﻿-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/15/2020
-- Description:	Update Planet Pop
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePlanetHarvest]
	@PlanetID int,
	@Materials float,
	@Population int,
	@Military int
AS
BEGIN
	DECLARE @NewHarvest datetime
	--SELECT @NewHarvest = dateadd(HOUR, 1 ,GETUTCDATE())
	SELECT @NewHarvest = dateadd(MINUTE, 1 ,GETUTCDATE())
Update dbo.PlanetDetail
	SET 
		Materials=Round(Materials+@Materials,2),
		Population=Population+@Population,
		Military=Military+@Military,
		LastHarvest= @NewHarvest
	WHERE PlanetID = @PlanetID
	
	SELECT @NewHarvest as NewHarvest

END