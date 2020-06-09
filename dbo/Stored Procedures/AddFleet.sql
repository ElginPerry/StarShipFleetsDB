-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/15/2020
-- Description:	Get Planet
-- =============================================
CREATE PROCEDURE [dbo].[AddFleet] 
	@UserID int,
	@PlanetID int
AS
BEGIN
	DECLARE @FleetName varchar(50), @FleetID int
	SELECT @FleetName ='Fleet' + CAST(count(*) as varchar(10))
	FROM dbo.Fleets 
	WHERE UserID = @UserID

	INSERT INTO [dbo].[Fleets]
        ([UserID]
		,[FleetName]
		,[PlanetID]
		,[Status]
        ,[Destination]
        ,[Arrival])
     VALUES
           (@UserID,
		   @FleetName,
		   @PlanetID,
		   0,
		   @PlanetID,
		   GETUTCDATE()
		   )

	SELECT CAST(SCOPE_IDENTITY() AS INT) AS [FleetID];
END