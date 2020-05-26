CREATE TABLE [dbo].[Planets] (
    [PlanetID]     INT           IDENTITY (1, 1) NOT NULL,
    [PlanetName]   NVARCHAR (50) NOT NULL,
    [PlanetType]   INT           NOT NULL,
    [Position]     INT           NOT NULL,
    [SubPosition]  INT           NOT NULL,
    [Galaxy]       INT           NOT NULL,
    [Sector]       NVARCHAR (10) NOT NULL,
    [System]       INT           NOT NULL,
    [XSysPosition] INT           NULL,
    [YSysPosition] INT           NULL,
    [Moon]         BIT           NULL,
    [Owner]        INT           NULL
);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-SectorSysIdx]
    ON [dbo].[Planets]([PlanetID] ASC)
    INCLUDE([Sector], [System]);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-OwnIdx]
    ON [dbo].[Planets]([PlanetID] ASC)
    INCLUDE([Owner]);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-Galaxyidx]
    ON [dbo].[Planets]([PlanetID] ASC)
    INCLUDE([Galaxy]);

