-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/6/2020
-- Description:	Get Planet Type Detail
-- =============================================
CREATE PROCEDURE [dbo].[GetPlanetTypeDetail] 
	@PlanetTypeID int
AS
BEGIN
	SELECT t.TypeID
		  ,t.TypeName
		  ,t.TextureNo
		  ,t.Infrastructure
		  ,t.Food
		  ,t.Mining
		  ,t.Research
		  ,t.Energy
		  ,t.Barren
	  FROM dbo.PlanetTypes t 
	  WHERE t.TextureNo = @PlanetTypeID
END