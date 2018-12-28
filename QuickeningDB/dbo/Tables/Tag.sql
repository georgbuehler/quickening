CREATE TABLE [dbo].[Tag] (
    [TagId]       UNIQUEIDENTIFIER CONSTRAINT [DF_Tag_TagId] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [Name]        NVARCHAR (50)    NOT NULL,
    [Description] NVARCHAR (500)   NULL,
    [CopyNumber]  INT              NULL,
	[EnteredDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    [LastModifiedDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED ([TagId] ASC)
);

GO

CREATE TRIGGER tru__Tag_UpdateLastModified
ON dbo.Tag
AFTER UPDATE
AS
    UPDATE dbo.Tag
    SET LastModifiedDateTime = GETDATE()
    WHERE TagId IN (SELECT DISTINCT TagId FROM Inserted)
