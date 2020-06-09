CREATE TABLE [dbo].[FleetDetails] (
    [FleetDetailID]   INT        IDENTITY (1, 1) NOT NULL,
    [FleetID]         INT        NULL,
    [DesignID]        INT        NULL,
    [ActualNumber]    INT        NULL,
    [EffectiveNumber] FLOAT (53) NULL,
    [UserID]          INT        NULL
);

