-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/27/2020
-- Description:	Create Galaxy
-- =============================================
CREATE PROCEDURE [dbo].[GetResearchTypes] 
	@UserID int 
AS
BEGIN
	SET NOCOUNT ON;

	WITH BdQue(cnt, BuildingID, PlanetID)
	AS 
	(
		SELECT count(b.BuildQueID) as cnt, BuildingID, UserID  
		FROM dbo.BuildingQue b
		WHERE b.UserID = @UserID AND b.Type = 2
		GROUP BY BuildingID, UserID
	)

	SELECT 
		t.TechnologyID
		,t.Name
		,t.PopulationMax
		,t.Energy
		,t.Food
		,t.Research
		,t.Mining
		,t.Infrastructure
		,t.Military
		,t.Laser
		,t.Missile
		,t.Plasma
		,t.Shields
		,t.Armor
		,t.BodyArmor
		,t.Weapons
		,t.TechnologyCost
		,isnull(pt.TechLevel,0) as BldLevel
		,isnull(pt.TechLevel,0) + isnull(BdQue.cnt,0) as QuedLevel
		,t.TechID
		,t.TechLevel
	FROM [dbo].Technology t
	LEFT JOIN dbo.PlayerTechnology pt on pt.TechID = t.TechnologyID AND pt.UserID = @UserID
	LEFT JOIN BdQue on BdQue.BuildingID = t.TechnologyID	
	ORDER BY t.SortOrder
END