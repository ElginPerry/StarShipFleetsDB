CREATE TABLE [dbo].[PlanetDetail] (
    [PlanetDetailID]         INT        IDENTITY (1, 1) NOT NULL,
    [Owner]                  INT        NULL,
    [PlanetID]               INT        NOT NULL,
    [Materials]              FLOAT (53) CONSTRAINT [DF_PlanetDetail_Materials] DEFAULT ((0)) NOT NULL,
    [Population]             INT        NULL,
    [FoodPop]                INT        CONSTRAINT [DF_PlanetDetail_FoodPop] DEFAULT ((0)) NULL,
    [EnergyPop]              INT        CONSTRAINT [DF_PlanetDetail_EnergyPop] DEFAULT ((0)) NOT NULL,
    [ResearchPop]            INT        CONSTRAINT [DF_PlanetDetail_ResearchPop] DEFAULT ((0)) NOT NULL,
    [MetalsPop]              INT        CONSTRAINT [DF_PlanetDetail_MetalsPop] DEFAULT ((0)) NOT NULL,
    [InfrastructurePop]      INT        CONSTRAINT [DF_PlanetDetail_infrastructurePop] DEFAULT ((0)) NOT NULL,
    [InfrastructurePopMetal] INT        NULL,
    [LastHarvest]            DATETIME   CONSTRAINT [DF_PlanetDetail_LastHarvest] DEFAULT (getdate()) NULL,
    [LastPopChange]          DATETIME   NULL
);

