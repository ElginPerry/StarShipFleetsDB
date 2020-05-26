-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/22/2020
-- Description:	Get Building Queue
-- =============================================
CREATE PROCEDURE [dbo].[RemoveBuildingQueue] 
	@BuildQueID int
AS
BEGIN
	DELETE FROM [dbo].[BuildingQue]
    WHERE BuildQueID = @BuildQueID
END