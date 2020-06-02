-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/28/2020
-- Description:	Get Ship Hulls
-- =============================================
CREATE PROCEDURE [dbo].[GetShipHulls] 
	
AS
BEGIN
SELECT [HullID]
      ,[HullName]
      ,[SortOrder]
      ,[MaterialCost]
      ,[Hull]
      ,[NumPods]
      ,[TechID]
      ,[TechLevel]
      ,[BuildingID]
      ,[BuildingLevel]
  FROM [dbo].[Hulls]
  Order by SortOrder
 
END