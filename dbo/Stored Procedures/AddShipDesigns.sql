-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/29/2020
-- Description:	[ADD Ship Designs]
-- =============================================
CREATE PROCEDURE [dbo].[AddShipDesigns] 
	@UserID int
	,@DesignName varchar(50)
	,@HullID int
	,@ShipYardLevel int
	,@MaterialCost float
    ,@MilitaryCost int
	,@Energy float
	,@EnergyCost float
    ,@Laser float
    ,@Missile float
    ,@Plasma float
    ,@Shields float
    ,@Armor float
    ,@Bays float
    ,@Movement float
AS
BEGIN

INSERT INTO [dbo].[ShipDesigns]
           (
		   [UserID]
           ,[DesignName]
           ,[HullID]
           ,[ShipYardLevel]
           ,[MaterialCost]
           ,[MilitaryCost]
		   ,[Energy]
		   ,[EnergyCost]
           ,[Laser]
           ,[Missile]
           ,[Plasma]
           ,[Shields]
           ,[Armor]
           ,[Bays]
           ,[Movement]
		   )
     VALUES
           (	
			@UserID 
			,@DesignName 
			,@HullID 
			,@ShipYardLevel 
			,@MaterialCost 
			,@MilitaryCost 
			,@Energy
			,@EnergyCost
			,@Laser 
			,@Missile 
			,@Plasma 
			,@Shields 
			,@Armor 
			,@Bays 
			,@Movement 
			)

	SELECT CAST(SCOPE_IDENTITY() AS INT) AS [ShipDesignID];
END