CREATE TABLE [dbo].[PlanetTypes] (
    [TypeID]         INT          IDENTITY (1, 1) NOT NULL,
    [TypeName]       VARCHAR (25) NULL,
    [TextureNo]      INT          NOT NULL,
    [Infrastructure] FLOAT (53)   NOT NULL,
    [Food]           FLOAT (53)   NULL,
    [Mining]         FLOAT (53)   NOT NULL,
    [Research]       FLOAT (53)   NOT NULL,
    [Energy]         FLOAT (53)   NOT NULL,
    [Barren]         BIT          CONSTRAINT [DF_PlanetTypes_Barren] DEFAULT ((0)) NOT NULL
);

