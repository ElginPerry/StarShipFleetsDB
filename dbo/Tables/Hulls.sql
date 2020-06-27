CREATE TABLE [dbo].[Hulls] (
    [HullID]        INT          IDENTITY (1, 1) NOT NULL,
    [HullName]      VARCHAR (50) NULL,
    [SortOrder]     INT          NULL,
    [MaterialCost]  FLOAT (53)   NULL,
    [Hull]          FLOAT (53)   NULL,
    [NumPods]       INT          NULL,
    [TechID]        INT          NULL,
    [TechLevel]     INT          NULL,
    [BuildingID]    INT          NULL,
    [BuildingLevel] INT          NULL,
    [RequiresBay]   BIT          NULL
);



