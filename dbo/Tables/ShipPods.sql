CREATE TABLE [dbo].[ShipPods] (
    [ShipPodID]     INT          IDENTITY (1, 1) NOT NULL,
    [PodName]       VARCHAR (50) NULL,
    [SortOrder]     INT          NULL,
    [Mass]          INT          NULL,
    [MaterialCost]  FLOAT (53)   NULL,
    [EnergyCost]    FLOAT (53)   NULL,
    [MilitaryCost]  INT          NULL,
    [Energy]        FLOAT (53)   NULL,
    [Laser]         FLOAT (53)   NULL,
    [Missile]       FLOAT (53)   NULL,
    [Plasma]        FLOAT (53)   NULL,
    [Shields]       FLOAT (53)   NULL,
    [Armor]         FLOAT (53)   NULL,
    [Bays]          FLOAT (53)   NULL,
    [Movement]      FLOAT (53)   NULL,
    [Colony]        INT          NULL,
    [TechID]        INT          NULL,
    [TechLevel]     INT          NULL,
    [BuildingID]    INT          NULL,
    [BuildingLevel] INT          NULL
);





