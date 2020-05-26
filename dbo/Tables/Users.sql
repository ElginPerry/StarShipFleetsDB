CREATE TABLE [dbo].[Users] (
    [UserID]         INT            IDENTITY (1, 1) NOT NULL,
    [UserEmail]      NVARCHAR (100) NOT NULL,
    [Password]       NVARCHAR (50)  NOT NULL,
    [Premium]        BIT            CONSTRAINT [DF_Users_Premium] DEFAULT ((0)) NOT NULL,
    [PremiumExpires] DATETIME       NULL,
    [LastLogin]      DATETIME       NULL,
    [IPAddress]      NVARCHAR (50)  NULL,
    [Joined]         DATETIME       CONSTRAINT [DF_Users_Joined] DEFAULT (getdate()) NULL,
    [Banned]         BIT            CONSTRAINT [DF_Users_Banned] DEFAULT ((0)) NULL
);

