-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/22/2020
-- Description:	[Add Planet Building]
-- =============================================
CREATE PROCEDURE [dbo].[AddPlanetBuilding]
	@PlanetID int,
	@BuildingID int	
AS
BEGIN
Declare @BldLevel int

SELECT @BldLevel = BldLevel
FROM [dbo].[PlanetBuilding]
WHERE PlanetID = @PlanetID
AND BuildingID = @BuildingID

	IF @BldLevel is null	
	BEGIN
		INSERT INTO [dbo].[PlanetBuilding]
			   ([PlanetID]
			   ,[BuildingID]
			   ,[BldLevel])
		 VALUES
			   (@PlanetID
			   ,@BuildingID
			   ,1)
	END
	ELSE
	BEGIN
		UPDATE [dbo].[PlanetBuilding]
			SET [BldLevel] = [BldLevel] + 1
			WHERE BuildingID = @BuildingID
			AND PlanetID = @PlanetID
	END
END