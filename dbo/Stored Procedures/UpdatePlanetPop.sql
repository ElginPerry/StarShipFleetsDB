-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/15/2020
-- Description:	Update Planet Pop
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePlanetPop]
	@PlanetID int,
	@InfrastructurePop int,
	@InfrastructurePopMetal int,
	@EnergyPop int,
	@MetalsPop int,
	@ResearchPop int,
	@FoodPop int
AS
BEGIN
	Update dbo.PlanetDetail
	SET 
		InfrastructurePop=@InfrastructurePop,
		InfrastructurePopMetal=@InfrastructurePopMetal,
		EnergyPop=@EnergyPop,
		MetalsPop=@MetalsPop,
		ResearchPop=@ResearchPop,
		FoodPop=@FoodPop,
		LastPopChange=GETUTCDATE() 
	WHERE PlanetID = @PlanetID
	
END