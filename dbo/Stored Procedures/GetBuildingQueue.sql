-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/22/2020
-- Description:	Get Building Queue
-- =============================================
CREATE PROCEDURE [dbo].[GetBuildingQueue] 
	@planetID int = 308
AS
BEGIN
	SET NOCOUNT ON;

	SELECT q.[BuildQueID]
		,q.[BuildingID]
		,q.[PlanetID]
		,q.[UserID]
		,q.[Seconds]
		,q.[CompletetionDate]
		,q.[DateQued]
		,b.Name as BuildingName
	FROM [dbo].[BuildingQue] q
	JOIN dbo.Buildings b ON b.BuildingID = q.BuildingID
	WHERE PlanetID = @planetID

END