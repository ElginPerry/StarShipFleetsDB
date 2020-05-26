﻿-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/22/2020
-- Description:	Add Building Que
-- =============================================
CREATE PROCEDURE [dbo].[AddBuildingQue]
	@BuildingID int,
	@PlanetID int,
	@UserID int,
	@Seconds float,
	@CompletetionDate datetime
AS
BEGIN
	INSERT INTO [dbo].[BuildingQue]
		([BuildingID]
		,[PlanetID]
		,[UserID]
		,[Seconds]
		,[CompletetionDate]
		)
	 VALUES
		(@BuildingID
		,@PlanetID
		,@UserID
		,@Seconds
		,@CompletetionDate
		)
END