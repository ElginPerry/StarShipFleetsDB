-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/6/2020
-- Description:	Create Galaxy
-- =============================================
CREATE PROCEDURE [dbo].[CleanPlanets]
AS
BEGIN
	DROP TABLE Planets

	CREATE TABLE [dbo].[Planets](
		[PlanetID] [int] IDENTITY(1,1) NOT NULL,
		[PlanetName] [nvarchar](50) NOT NULL,
		[PlanetType] [int] NOT NULL,
		[Position] [int] NOT NULL,
		[SubPosition] [int] NOT NULL,
		[Galaxy] int NOT NULL,
		[Sector] [nvarchar](10) NOT NULL,
		[System] int NOT NULL,
		XSysPosition int,
		YSysPosition int,
		[Moon] [bit] NULL,
		[Owner] [int] NULL
	) ON [PRIMARY]


	CREATE NONCLUSTERED INDEX [NonClusteredIndex-Galaxyidx] ON [dbo].[Planets]
	(
		[PlanetID] ASC
	)
	INCLUDE ( 	[Galaxy]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [NonClusteredIndex-OwnIdx] ON [dbo].[Planets]
	(
		[PlanetID] ASC
	)
	INCLUDE ( 	[Owner]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [NonClusteredIndex-SectorSysIdx] ON [dbo].[Planets]
	(
		[PlanetID] ASC
	)
	INCLUDE ( 	[Sector],
		[System]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


	Truncate TABLE dbo.PlanetBuilding
	Truncate TABLE dbo.PlanetDetail
	Truncate TABLE dbo.PlayerTechnology
	Truncate TABLE dbo.ShipDesigns
	Truncate TABLE dbo.ShipDesignsPods
	Truncate TABLE dbo.Fleets
	Truncate TABLE dbo.FleetDetails
	Truncate TABLE dbo.Users
	Truncate TABLE dbo.BuildingQue

END