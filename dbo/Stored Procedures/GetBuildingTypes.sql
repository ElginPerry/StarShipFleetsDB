-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/20/2020
-- Description:	Create Galaxy
-- =============================================
CREATE PROCEDURE [dbo].[GetBuildingTypes] 
	@PlanetID int = 308
AS
BEGIN
	SET NOCOUNT ON;

	WITH BdQue(cnt, BuildingID, PlanetID)
	AS 
	(
		SELECT count(b.BuildQueID) as cnt, BuildingID, PlanetID  
		FROM dbo.BuildingQue b
		WHERE b.PlanetID = @PlanetID AND b.Type = 1
		GROUP BY BuildingID, PlanetID
	)

	SELECT 
		b.BuildingID
		,b.Name
		,b.PopulationMax
		,b.PopulationCost
		,b.Energy
		,b.EnergyCost
		,b.Food
		,b.Research
		,b.Mining
		,b.Infrastructure
		,b.Military
		,b.TradeRoutes
		,b.MaterialCost
		,b.ProductionCost
		,isnull(pb.BldLevel,0) as BldLevel
		,isnull(pb.BldLevel,0) + isnull(BdQue.cnt,0) as QuedLevel
		,b.TechID
		,b.TechLevel
	FROM [dbo].[Buildings] b
	LEFT JOIN dbo.PlanetBuilding pb on pb.BuildingID = b.BuildingID AND pb.PlanetID = @PlanetID
	LEFT JOIN BdQue on BdQue.BuildingID = b.BuildingID 
	WHERE ShowFlag = 1
	ORDER BY b.SortOrder
END