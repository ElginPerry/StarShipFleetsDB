-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/8/2020
-- Description:	Get Galaxy
-- =============================================
CREATE PROCEDURE [dbo].[GetGalaxy] 
	@Galaxy int,
	@Sector int = null,
	@System int = null 
AS
BEGIN
SELECT PlanetID
      ,PlanetName
      ,PlanetType
      ,Position
      ,SubPosition
      ,Galaxy
      ,Sector
      ,System
      ,XSysPosition
      ,YSysPosition
      ,Moon
      ,Owner
  FROM dbo.Planets
  WHERE Galaxy = @Galaxy
  AND (@Sector is null OR @Sector = Sector)	
  AND (@System is null OR @System = System)	
END