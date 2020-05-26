-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/22/2020
-- Description:	Get Planet Stats
-- =============================================
CREATE PROCEDURE [dbo].[GetPlanetStats] 
	@PlanetID int 
AS
BEGIN
	SELECT 
		sum(pb.BldLevel*b.Energy*pt.Energy) as Energy
		,sum(pb.BldLevel*b.EnergyCost) as EnergyCost
		,sum(pb.BldLevel*b.Food*pt.Food) as Food
		,sum(pb.BldLevel*b.Research*pt.Research) as Research
		,sum(pb.BldLevel*b.Mining*pt.Mining) as Mining
		,sum(pb.BldLevel*b.PopulationMax) as PopulationMax
		,sum(pb.BldLevel*b.Infrastructure*pt.Infrastructure) as Infrastructure
	FROM dbo.PlanetBuilding pb
	JOIN dbo.Planets p on p.PlanetID = pb.PlanetID
	JOIN dbo.PlanetTypes pt on pt.TextureNo = p.PlanetType
	JOIN dbo.Buildings b on b.BuildingID = pb.BuildingID
	JOIN dbo.PlanetDetail pd on pd.PlanetID = p.PlanetID
	WHERE pb.PlanetID = @PlanetID
END