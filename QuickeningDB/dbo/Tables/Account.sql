CREATE TABLE [dbo].[Account] (
    [AccountId]                 UNIQUEIDENTIFIER CONSTRAINT [DF_Account_AccountId] DEFAULT (newid()) NOT NULL,
    [Name]                      VARCHAR (500)    NOT NULL,
    [Description]               NVARCHAR (500)   NULL,
    [AccountTypeId]             UNIQUEIDENTIFIER NOT NULL,
    [TaxDeferred]               BIT              CONSTRAINT [DF_Account_TaxDeferred] DEFAULT ((0)) NOT NULL,
    [InterestRate]              DECIMAL (16, 2)  NULL,
    [FinancialInstitution]      NVARCHAR (100)   NULL,
    [RoutingNumber]             NVARCHAR (10)    NULL,
    [CustomerId]                NVARCHAR (50)    NULL,
    [ContactName]               NVARCHAR (100)   NULL,
    [Phone]                     NVARCHAR (20)    NULL,
    [HomePage]                  NVARCHAR (200)   NULL,
    [Comments]                  NVARCHAR (500)   NULL,
    [SeparateAccount]           BIT              CONSTRAINT [DF_Account_SeparateAccount] DEFAULT ((0)) NULL,
    [HideAccountInList]         BIT              CONSTRAINT [DF_Account_HideAccountInList] DEFAULT ((0)) NULL,
    [HideAccountInTransactions] BIT              CONSTRAINT [DF_Account_HideAccountInTransactions] DEFAULT ((0)) NULL,
    [AccountGroupId]            UNIQUEIDENTIFIER NOT NULL,
    [ParentAccountId]           UNIQUEIDENTIFIER NULL,
    [SecurityId]                UNIQUEIDENTIFIER NULL,
    [TaxLineItemId]             UNIQUEIDENTIFIER NULL,
    [EnteredDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    [LastModifiedDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED ([AccountId] ASC),
    CONSTRAINT [FK_Account_Account] FOREIGN KEY ([ParentAccountId]) REFERENCES [dbo].[Account] ([AccountId]),
    CONSTRAINT [FK_Account_AccountGroup] FOREIGN KEY ([AccountGroupId]) REFERENCES [dbo].[AccountGroup] ([AccountGroupId]),
    CONSTRAINT [FK_Account_AccountType] FOREIGN KEY ([AccountTypeId]) REFERENCES [dbo].[AccountType] ([AccountTypeId]),
    CONSTRAINT [FK_Account_Security] FOREIGN KEY ([SecurityId]) REFERENCES [dbo].[Security] ([SecurityId]),
    CONSTRAINT [FK_Account_TaxLineItem] FOREIGN KEY ([TaxLineItemId]) REFERENCES [dbo].[TaxLineItem] ([TaxLineItemId])
);


GO

CREATE TRIGGER [dbo].[tru_Account_UpdateLastModified]
    ON [dbo].[Account]
    AFTER UPDATE
    AS
    UPDATE dbo.Account
    SET LastModifiedDateTime = GETDATE()
    WHERE AccountId IN (SELECT DISTINCT AccountId FROM Inserted)