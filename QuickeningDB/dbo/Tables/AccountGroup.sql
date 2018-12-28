CREATE TABLE [dbo].[AccountGroup] (
    [AccountGroupId] UNIQUEIDENTIFIER CONSTRAINT [DF_AccountGroup_AccountGroupId] DEFAULT (newid()) NOT NULL,
    [Name]           NVARCHAR (100)   NOT NULL,
    [Description]    NVARCHAR (500)   NULL,
    [SystemRequired] BIT              CONSTRAINT [DF_AccountGroup_SystemRequired] DEFAULT ((0)) NOT NULL,
    [EnteredDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    [LastModifiedDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    CONSTRAINT [PK_AccountGroup] PRIMARY KEY CLUSTERED ([AccountGroupId] ASC)
);


GO

CREATE TRIGGER [dbo].[tru_AccountGroup_UpdateLastModified]
    ON [dbo].[AccountGroup]
    AFTER UPDATE
    AS
    UPDATE dbo.AccountGroup
    SET LastModifiedDateTime = GETDATE()
    WHERE [AccountGroupId] IN (SELECT DISTINCT [AccountGroupId] FROM Inserted)