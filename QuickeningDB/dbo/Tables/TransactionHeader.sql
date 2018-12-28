CREATE TABLE [dbo].[TransactionHeader] (
    [TransactionId]        UNIQUEIDENTIFIER CONSTRAINT [DF_TransactionHeader_TransactionId] DEFAULT (newid()) NOT NULL,
    [TransactionDate]      DATE             NOT NULL,
    [TransactionNumber]    NVARCHAR (50)    NULL,
    [Payee]                NVARCHAR (50)    NOT NULL,
    [Memo]                 NVARCHAR (100)   NULL,
    [Reconciled]           NVARCHAR (1)     NULL,
    [PostedDate]           DATE             CONSTRAINT [DF_TransactionHeader_PostedDate] DEFAULT (CONVERT([date],getdate())) NOT NULL,
    [EnteredDateTime]      DATETIME         CONSTRAINT [DF_TransactionHeader_EnteredDateTime] DEFAULT (getdate()) NOT NULL,
    [LastModifiedDateTime] DATETIME         CONSTRAINT [DF_TransactionHeader_LastModifiedDateTime] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_TransactionHeader] PRIMARY KEY CLUSTERED ([TransactionId] ASC)
);


GO
CREATE TRIGGER tru_UpdateLastModified
ON dbo.TransactionHeader
AFTER UPDATE
AS
    UPDATE dbo.TransactionHeader
    SET LastModifiedDateTime = GETDATE()
    WHERE TransactionId IN (SELECT DISTINCT TransactionId FROM Inserted)