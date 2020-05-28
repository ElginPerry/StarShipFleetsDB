CREATE TABLE [dbo].[Buildings] (
    [BuildingID]     INT          IDENTITY (1, 1) NOT NULL,
    [Name]           VARCHAR (50) NULL,
    [PopulationMax]  FLOAT (53)   NULL,
    [PopulationCost] FLOAT (53)   NULL,
    [Energy]         FLOAT (53)   NULL,
    [EnergyCost]     FLOAT (53)   NULL,
    [Food]           FLOAT (53)   NULL,
    [Research]       FLOAT (53)   NULL,
    [Mining]         FLOAT (53)   NULL,
    [Infrastructure] FLOAT (53)   NULL,
    [TradeRoutes]    INT          NULL,
    [Military]       FLOAT (53)   NULL,
    [MaterialCost]   FLOAT (53)   NULL,
    [ProductionCost] FLOAT (53)   NULL,
    [ShowFlag]       BIT          CONSTRAINT [DF_Buildings_ShowFlag] DEFAULT ((1)) NULL,
    [TechID]         INT          NULL,
    [TechLevel]      INT          NULL,
    [SortOrder]      INT          NULL
);



