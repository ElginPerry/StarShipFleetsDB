-- =============================================
-- Author:		Elgin Perry
-- Create date: 6/11/2020
-- Description:	[Get First Planet]
-- =============================================
CREATE PROCEDURE [dbo].[GetFirstPlanet]
   @UserID int = 1  
AS
BEGIN

	DECLARE @TotalTerra float, @AvailTerra float, @Galaxy int = 0, @Found int = 0, @PlanetID int = 0
	DECLARE @Planet TABLE
	(
		[PlanetID] int,
		ID UNIQUEIDENTIFIER null
	)

	IF exists( 
		SELECT top 1 
		p.PlanetID
		FROM dbo.Planets p
		WHERE
		p.Owner =@UserID)
	BEGIN
		SELECT top 1 
		@PlanetID = p.PlanetID
		FROM dbo.Planets p
		WHERE
		p.Owner =@UserID

		SELECT @PlanetID as PlanetID
	END
	ELSE
	BEGIN
		While @Found = 0
		BEGIN
			SET @Galaxy = @Galaxy + 1
			SELECT
			@AvailTerra = count(*) 
			FROM dbo.Planets p
			WHERE
			p.Owner = 0
			AND p.PlanetType = 2
			AND p.Galaxy = @Galaxy

			SELECT
			@TotalTerra = count(*)
			FROM dbo.Planets p
			WHERE
			p.PlanetType = 2 
			AND p.Galaxy = @Galaxy

			IF @AvailTerra/@TotalTerra > .4
				SET @Found = 1
		END

		INSERT INTO @Planet
		(
		PlanetID,
		ID
		)
		SELECT top 1 
		p.PlanetID, NEWID() as ID
		FROM dbo.Planets p
			WHERE
			p.Owner = 0
			AND p.PlanetType = 2
			AND p.Galaxy = @Galaxy
		Order by ID

		SELECT top 1 @PlanetID = PlanetID
		FROM @Planet

		Update dbo.Planets
		SET 
			Owner=@UserID
		WHERE PlanetID = @PlanetID

		Insert into dbo.PlanetDetail
		(
		  [PlanetID]
		  ,[Materials]
		  ,[Population]
		  ,[Military]
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
			50,
			6,
			5,
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
			2
		)

		SELECT @PlanetID as PlanetID
	END
END