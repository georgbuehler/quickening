CREATE TABLE [dbo].[SecurityPriceHistory] (
    [SecurityPriceHistoryId] UNIQUEIDENTIFIER CONSTRAINT [DF_SecurityPriceHistory_SecurityPriceHistoryId] DEFAULT (newid()) NOT NULL,
    [PriceDateTime]          DATETIME         NOT NULL,
    [SecurityId]             UNIQUEIDENTIFIER NOT NULL,
    [Price]                  MONEY            NOT NULL,
	[EnteredDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    [LastModifiedDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    CONSTRAINT [PK_SecurityPriceHistory] PRIMARY KEY CLUSTERED ([SecurityPriceHistoryId] ASC),
    CONSTRAINT [FK_SecurityPriceHistory_Security] FOREIGN KEY ([SecurityId]) REFERENCES [dbo].[Security] ([SecurityId])
);

GO 

CREATE TRIGGER tru_SecurityPriceHistory_UpdateLastModified
ON dbo.SecurityPriceHistory
AFTER UPDATE
AS
    UPDATE dbo.SecurityPriceHistory
    SET LastModifiedDateTime = GETDATE()
    WHERE SecurityPriceHistoryId IN (SELECT DISTINCT SecurityPriceHistoryId FROM Inserted)