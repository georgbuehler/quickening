CREATE TABLE [dbo].[AccountType] (
    [AccountTypeId]  UNIQUEIDENTIFIER CONSTRAINT [DF_AccountType_AccountTypeId] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [Name]           NVARCHAR (100)   NOT NULL,
    [Description]    NVARCHAR (500)   NULL,
    [SystemRequired] BIT              CONSTRAINT [DF_AccountType_SystemRequired] DEFAULT ((0)) NULL,
	[EnteredDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    [LastModifiedDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    CONSTRAINT [PK_AccountType] PRIMARY KEY CLUSTERED ([AccountTypeId] ASC)
);


GO

CREATE TRIGGER [dbo].[tru_AccountType_UpdateLastModified]
    ON [dbo].[AccountType]
    AFTER UPDATE
    AS
    UPDATE dbo.AccountType
    SET LastModifiedDateTime = GETDATE()
    WHERE AccountTypeId IN (SELECT DISTINCT AccountTypeId FROM Inserted)