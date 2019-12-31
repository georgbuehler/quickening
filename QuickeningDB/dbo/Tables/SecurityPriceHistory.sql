CREATE TABLE [dbo].[SecurityPriceHistory] (
    [SecurityPriceHistoryId] UNIQUEIDENTIFIER CONSTRAINT [DF_SecurityPriceHistory_SecurityPriceHistoryId] DEFAULT (newid()) NOT NULL,
    [PriceDateTime]          DATETIME         NOT NULL,
    [SecurityId]             UNIQUEIDENTIFIER NOT NULL,
    [Price]                  MONEY            NOT NULL,
    CONSTRAINT [PK_SecurityPriceHistory] PRIMARY KEY CLUSTERED ([SecurityPriceHistoryId] ASC),
    CONSTRAINT [FK_SecurityPriceHistory_Security] FOREIGN KEY ([SecurityId]) REFERENCES [dbo].[Security] ([SecurityId])
);

