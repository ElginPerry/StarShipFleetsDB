-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/22/2020
-- Description:	Get Building Queue
-- =============================================
CREATE PROCEDURE [dbo].[GetBuildingQueue] 
	@UserID int 
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
		,q.Type
		,b.Name as BuildingName
		,t.Name as TechName
	FROM [dbo].[BuildingQue] q
	LEFT JOIN dbo.Buildings b ON b.BuildingID = q.BuildingID
	LEFT JOIN dbo.Technology t on t.TechnologyID = q.BuildingID
	WHERE q.UserID = @UserID  

END