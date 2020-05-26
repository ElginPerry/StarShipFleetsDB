-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/22/2020
-- Description:	Get Planet Stats
-- =============================================
CREATE PROCEDURE [dbo].[GetPlanetStatsOld] 
	@PlanetID int = 299
AS
BEGIN
	DECLARE @energy float, @energyMult float
	SELECT 
		@energy = (sum(pb.BldLevel*b.Energy*pt.Energy)+sum(pb.BldLevel*b.Energy*pt.Energy*pd.EnergyPop/100))/sum(pb.BldLevel*b.EnergyCost)
	FROM dbo.PlanetBuilding pb
	JOIN dbo.Planets p on p.PlanetID = pb.PlanetID
	JOIN dbo.PlanetTypes pt on pt.TextureNo = p.PlanetType
	JOIN dbo.Buildings b on b.BuildingID = pb.BuildingID
	JOIN dbo.PlanetDetail pd on pd.PlanetID = p.PlanetID
	WHERE pb.PlanetID = @PlanetID

	IF @energy > 1
		SET @energyMult = 1
	ELSE
		SET @energyMult = @energy


	SELECT 
		@energy as Energy
		,sum(pb.BldLevel*b.Food*pt.Food)+sum(pb.BldLevel*b.Food*pt.Food*pd.FoodPop/100)*@energyMult as Food
		,sum(pb.BldLevel*b.Research*pt.Research)+sum(pb.BldLevel*b.Research*pt.Research*pd.ResearchPop/100)*@energyMult as Research
		,sum(pb.BldLevel*b.Mining*pt.Mining)+sum(pb.BldLevel*b.Mining*pt.Mining*pd.MetalsPop/100)*@energyMult as Mining
		,sum(pb.BldLevel*b.PopulationMax) as PopulationMax
		,sum(pb.BldLevel*b.Infrastructure*pt.Infrastructure)+sum(pb.BldLevel*b.Infrastructure*pt.Infrastructure*pd.InfrastructurePop/100)*@energyMult as Infrastructure
	FROM dbo.PlanetBuilding pb
	JOIN dbo.Planets p on p.PlanetID = pb.PlanetID
	JOIN dbo.PlanetTypes pt on pt.TextureNo = p.PlanetType
	JOIN dbo.Buildings b on b.BuildingID = pb.BuildingID
	JOIN dbo.PlanetDetail pd on pd.PlanetID = p.PlanetID
	WHERE pb.PlanetID = @PlanetID
END