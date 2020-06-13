-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/22/2020
-- Description:	Add Building Que
-- =============================================
CREATE PROCEDURE [dbo].[AddBuildingQue]
	@BuildingID int,
	@PlanetID int,
	@UserID int,
	@Seconds float,
	@MaterialCost int,
	@CompletetionDate datetime,
	@Type int,
	@Movement float = null

AS
BEGIN
	INSERT INTO [dbo].[BuildingQue]
		([BuildingID]
		,[PlanetID]
		,[UserID]
		,[MaterialCost]
		,[Seconds]
		,[CompletetionDate]
		,[Type]
		,[Movement]
		)
	 VALUES
		(@BuildingID
		,@PlanetID
		,@UserID
		,@MaterialCost
		,@Seconds
		,@CompletetionDate
		,@Type
		,@Movement
		)
END