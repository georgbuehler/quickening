CREATE TABLE [dbo].[SecurityType] (
    [SecurityTypeId] UNIQUEIDENTIFIER CONSTRAINT [DF_SecurityType_SecurityTypeId] DEFAULT (newid()) NOT NULL,
    [Name]           NVARCHAR (100)   NOT NULL,
    [Description]    NVARCHAR (500)   NULL,
    [SystemRequired] BIT              CONSTRAINT [DF_SecurityType_SystemRequired] DEFAULT ((0)) NOT NULL,
	[EnteredDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    [LastModifiedDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    CONSTRAINT [PK_SecurityType] PRIMARY KEY CLUSTERED ([SecurityTypeId] ASC)
);

GO

CREATE TRIGGER tru_SecurityType_UpdateLastModified
ON dbo.SecurityType
AFTER UPDATE
AS
    UPDATE dbo.SecurityType
    SET LastModifiedDateTime = GETDATE()
    WHERE SecurityTypeId IN (SELECT DISTINCT SecurityTypeId FROM Inserted)