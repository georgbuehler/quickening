CREATE TABLE [dbo].[SecurityType] (
    [SecurityTypeId] UNIQUEIDENTIFIER CONSTRAINT [DF_SecurityType_SecurityTypeId] DEFAULT (newid()) NOT NULL,
    [Name]           NVARCHAR (100)   NOT NULL,
    [Description]    NVARCHAR (500)   NULL,
    [SystemRequired] BIT              CONSTRAINT [DF_SecurityType_SystemRequired] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_SecurityType] PRIMARY KEY CLUSTERED ([SecurityTypeId] ASC)
);

