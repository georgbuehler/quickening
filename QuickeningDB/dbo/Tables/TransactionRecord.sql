CREATE TABLE [dbo].[TransactionRecord] (
    [TransactionRecordId] UNIQUEIDENTIFIER CONSTRAINT [DF_TransactionRecord_TransactionRecordId] DEFAULT (newid()) NOT NULL,
    [TransactionId]       UNIQUEIDENTIFIER NOT NULL,
    [CreditAccountId]     UNIQUEIDENTIFIER NOT NULL,
    [DebitAccountId]      UNIQUEIDENTIFIER NOT NULL,
    [TagId]               UNIQUEIDENTIFIER NOT NULL,
    [Amount]              MONEY            CONSTRAINT [DF_TransactionRecord_Amount] DEFAULT ((0)) NOT NULL,
    [Memo]                NVARCHAR (500)   NULL,
    [Shares]              FLOAT (53)       NULL,
    [EnteredDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    [LastModifiedDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    CONSTRAINT [PK_TransactionRecord] PRIMARY KEY CLUSTERED ([TransactionRecordId] ASC),
    CONSTRAINT [FK_TransactionRecord_CreditAccount] FOREIGN KEY ([CreditAccountId]) REFERENCES [dbo].[Account] ([AccountId]),
    CONSTRAINT [FK_TransactionRecord_DebitAccount] FOREIGN KEY ([DebitAccountId]) REFERENCES [dbo].[Account] ([AccountId]),
    CONSTRAINT [FK_TransactionRecord_TransactionHeader] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[TransactionHeader] ([TransactionId])
);


GO

CREATE TRIGGER [dbo].[tru_TransactionRecord_UpdateLastModified]
    ON [dbo].[TransactionRecord]
    AFTER UPDATE
    AS
    UPDATE dbo.TransactionRecord
    SET LastModifiedDateTime = GETDATE()
    WHERE [TransactionRecordId] IN (SELECT DISTINCT [TransactionRecordId] FROM Inserted)