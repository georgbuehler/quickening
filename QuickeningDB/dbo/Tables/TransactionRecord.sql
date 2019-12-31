CREATE TABLE [dbo].[TransactionRecord] (
    [TransactionRecordId] UNIQUEIDENTIFIER CONSTRAINT [DF_TransactionRecord_TransactionRecordId] DEFAULT (newid()) NOT NULL,
    [TransactionId]       UNIQUEIDENTIFIER NOT NULL,
    [CreditAccountId]     UNIQUEIDENTIFIER NOT NULL,
    [DebitAccountId]      UNIQUEIDENTIFIER NOT NULL,
    [TagId]               UNIQUEIDENTIFIER NOT NULL,
    [Amount]              MONEY            CONSTRAINT [DF_TransactionRecord_Amount] DEFAULT ((0)) NOT NULL,
    [Memo]                NVARCHAR (500)   NULL,
    [Shares]              FLOAT (53)       NULL,
    CONSTRAINT [PK_TransactionRecord] PRIMARY KEY CLUSTERED ([TransactionRecordId] ASC),
    CONSTRAINT [FK_TransactionRecord_CreditAccount] FOREIGN KEY ([CreditAccountId]) REFERENCES [dbo].[Account] ([AccountId]),
    CONSTRAINT [FK_TransactionRecord_DebitAccount] FOREIGN KEY ([DebitAccountId]) REFERENCES [dbo].[Account] ([AccountId]),
    CONSTRAINT [FK_TransactionRecord_TransactionHeader] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[TransactionHeader] ([TransactionId])
);

