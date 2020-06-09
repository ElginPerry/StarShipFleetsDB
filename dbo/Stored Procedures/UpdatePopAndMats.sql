-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/22/2020
-- Description:	[Update Pop And Mats]
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePopAndMats]
	@PlanetID int,
	@Materials float,
	@Population int,
	@Military int
AS
BEGIN
	Update dbo.PlanetDetail
	SET 
		Materials = @Materials
		,Population = @Population
		,Military = @Military
	WHERE PlanetID = @PlanetID
	
END