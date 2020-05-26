-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/15/2020
-- Description:	Colonize Planet 
-- =============================================
CREATE PROCEDURE [dbo].[ColonizePlanet]
	@UserID int,
	@PlanetID int,
	@Population int,
	@Materials numeric(18,2)
AS
BEGIN
	Update dbo.Planets
	SET 
		Owner=@UserID
	WHERE PlanetID = @PlanetID

	Insert into dbo.PlanetDetail
	(
      [PlanetID]
      ,[Materials]
      ,[Population]
      ,[FoodPop]
      ,[EnergyPop]
      ,[ResearchPop]
      ,[MetalsPop]
      ,[InfrastructurePop]
      ,[InfrastructurePopMetal]
	  ,[Owner]
	)
	VALUES
	(
		@PlanetID,
		@Materials,
		@Population,
		60,
		0,
		0,
		20,
		20,
		0,
		@UserID
	)

	Insert into dbo.PlanetBuilding
	(
		[PlanetID]
		,[BuildingID]
		,[BldLevel]
	)
	VALUES
	(
		@PlanetID,
		8,
		1
	)



	
END