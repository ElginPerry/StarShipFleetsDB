﻿CREATE TABLE [dbo].[BuildingQue] (
    [BuildQueID]       INT        IDENTITY (1, 1) NOT NULL,
    [BuildingID]       INT        NULL,
    [PlanetID]         INT        NULL,
    [UserID]           INT        NULL,
    [MaterialCost]     INT        NULL,
    [Seconds]          FLOAT (53) NULL,
    [CompletetionDate] DATETIME   NULL,
    [DateQued]         DATETIME   CONSTRAINT [DF_BuildingQue_DateQued] DEFAULT (getdate()) NULL,
    [Type]             INT        NULL,
    [Movement]         FLOAT (53) NULL
);







