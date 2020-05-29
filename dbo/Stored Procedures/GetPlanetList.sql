-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/15/2020
-- Description:	Get Planet
-- =============================================
CREATE PROCEDURE [dbo].[GetPlanetList] 
	@UserID int = null
AS
BEGIN
SELECT p.[PlanetID]
      ,p.[PlanetName]
	  ,p.PlanetType
      ,p.[Galaxy]
      ,p.[Sector]
	  ,p.[System]
      ,p.[xSysPosition]
      ,p.[Moon]
      ,p.[Owner]
	  ,u.UserEmail
	  ,pd.Materials
	  ,pd.Population
	  ,pd.Military
	  ,pd.InfrastructurePop
	  ,pd.InfrastructurePopMetal
	  ,pd.EnergyPop
	  ,pd.MetalsPop
	  ,pd.ResearchPop
	  ,pd.FoodPop
	  ,pd.LastHarvest
	  ,pd.LastPopChange
	  ,pt.Barren
	  ,pt.Energy as ptEnergy
	  ,pt.Food as ptFood
	  ,pt.Infrastructure as ptInfrastructure
	  ,pt.Mining as ptMining
	  ,pt.Research as ptResearch
	  ,pt.TypeName
  FROM [dbo].[Planets] p
  LEFT JOIN dbo.Users u ON u.UserID = p.Owner
  LEFT JOIN dbo.PlanetDetail pd ON pd.PlanetID = p.PlanetID 
  JOIN dbo.PlanetTypes pt ON pt.TextureNo = p.PlanetType
  WHERE p.Owner = @UserID

END