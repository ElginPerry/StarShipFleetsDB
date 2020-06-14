-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/28/2020
-- Description:	Get Ship Pods
-- =============================================
CREATE PROCEDURE [dbo].[GetShipPods] 
	
AS
BEGIN
	SELECT [ShipPodID]
      ,[PodName]
      ,[SortOrder]
      ,[MaterialCost]
	  ,[Mass]
      ,[Energy]
      ,[EnergyCost]
	  ,[MilitaryCost]
      ,[Laser]
      ,[Missile]
      ,[Plasma]
      ,[Shields]
      ,[Armor]
	  ,[Bays]
      ,[Movement]
	  ,[Colony]
      ,[TechID]
      ,[TechLevel]
      ,[BuildingID]
      ,[BuildingLevel]
  FROM [dbo].[ShipPods]
  Order by SortOrder
 
END