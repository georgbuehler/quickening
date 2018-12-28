CREATE TABLE [dbo].[AssetClass] (
    [AssetClassId]   UNIQUEIDENTIFIER CONSTRAINT [DF_AssetClass_AssetClassId] DEFAULT (newid()) NOT NULL,
    [Name]           NVARCHAR (100)   NOT NULL,
    [Description]    NVARCHAR (500)   NULL,
    [SystemRequired] BIT              CONSTRAINT [DF_AssetClass_SystemRequired] DEFAULT ((0)) NOT NULL,
	[EnteredDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    [LastModifiedDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    CONSTRAINT [PK_AssetClass] PRIMARY KEY CLUSTERED ([AssetClassId] ASC)
);
GO 

CREATE TRIGGER [dbo].[tru_AssetClass_UpdateLastModified]
    ON [dbo].[AssetClass]
    AFTER UPDATE
    AS
    UPDATE dbo.AssetClass
    SET LastModifiedDateTime = GETDATE()
    WHERE AssetClassId IN (SELECT DISTINCT AssetClassId FROM Inserted)