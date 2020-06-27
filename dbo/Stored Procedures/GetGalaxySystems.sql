-- =============================================
-- Author:		Elgin Perry
-- Create date: 6/18/2020
-- Description:	Get Galaxy Systems
-- =============================================
CREATE PROCEDURE [dbo].[GetGalaxySystems] 
	@Galaxy int
AS
BEGIN
SELECT 
      Galaxy
      ,Sector
      ,System
      ,XSysPosition
      ,YSysPosition 
  FROM dbo.Planets
  WHERE Galaxy = @Galaxy
  GROUP BY  Galaxy
      ,Sector
      ,System
      ,XSysPosition
      ,YSysPosition 
 
END