-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/29/2020
-- Description:	[ADD Ship Designs]
-- =============================================
CREATE PROCEDURE [dbo].[AddShipDesigns] 
	@UserID int
	,@DesignName varchar(50)
	,@HullID int
AS
BEGIN

INSERT INTO [dbo].[ShipDesigns]
           ([UserID]
           ,[DesignName]
           ,[HullID])
     VALUES
           (@UserID 
			,@DesignName 
			,@HullID ) 
END