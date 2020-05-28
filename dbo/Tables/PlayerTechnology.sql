CREATE TABLE [dbo].[PlayerTechnology] (
    [PlayerTechnologyID] INT IDENTITY (1, 1) NOT NULL,
    [UserID]             INT NULL,
    [TechID]             INT NULL,
    [TechLevel]          INT NULL,
    CONSTRAINT [PK_PlayerTechnology] PRIMARY KEY CLUSTERED ([PlayerTechnologyID] ASC)
);

