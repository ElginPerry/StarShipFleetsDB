CREATE TABLE [dbo].[PlanetBuilding] (
    [PlanetBuildingID] INT IDENTITY (1, 1) NOT NULL,
    [PlanetID]         INT NULL,
    [BuildingID]       INT NULL,
    [BldLevel]         INT NULL,
    CONSTRAINT [PK_PlanetBuilding] PRIMARY KEY CLUSTERED ([PlanetBuildingID] ASC)
);

