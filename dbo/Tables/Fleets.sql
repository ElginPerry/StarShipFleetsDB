CREATE TABLE [dbo].[Fleets] (
    [FleetID]     INT          IDENTITY (1, 1) NOT NULL,
    [UserID]      INT          NULL,
    [FleetName]   VARCHAR (50) NULL,
    [PlanetID]    INT          NULL,
    [Status]      INT          CONSTRAINT [DF_Fleets_Status] DEFAULT ((0)) NULL,
    [Destination] INT          NULL,
    [Arrival]     DATETIME     NULL
);

