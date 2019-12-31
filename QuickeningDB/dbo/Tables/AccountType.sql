CREATE TABLE [dbo].[AccountType] (
    [AccountTypeId]  UNIQUEIDENTIFIER CONSTRAINT [DF_AccountType_AccountTypeId] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [Name]           NVARCHAR (100)   NOT NULL,
    [Description]    NVARCHAR (500)   NULL,
    [SystemRequired] BIT              CONSTRAINT [DF_AccountType_SystemRequired] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_AccountType] PRIMARY KEY CLUSTERED ([AccountTypeId] ASC)
);

