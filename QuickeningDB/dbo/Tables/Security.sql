CREATE TABLE [dbo].[Security] (
    [SecurityId]      UNIQUEIDENTIFIER CONSTRAINT [DF_Security_SecurityId] DEFAULT (newid()) NOT NULL,
    [Name]            NVARCHAR (100)   NOT NULL,
    [Symbol]          NVARCHAR (10)    NULL,
    [SecurityTypeId]  UNIQUEIDENTIFIER NOT NULL,
    [DownloadQuotes]  BIT              CONSTRAINT [DF_Security_DownloadQuotes] DEFAULT ((0)) NOT NULL,
    [WatchList]       BIT              CONSTRAINT [DF_Security_WatchList] DEFAULT ((0)) NOT NULL,
    [Hide]            BIT              CONSTRAINT [DF_Security_Hide] DEFAULT ((0)) NOT NULL,
    [TaxFree]         BIT              CONSTRAINT [DF_Security_TaxFree] DEFAULT ((0)) NOT NULL,
    [UseAverageCost]  BIT              CONSTRAINT [DF_Security_UseAverageCost] DEFAULT ((1)) NOT NULL,
    [InvestingGoalId] UNIQUEIDENTIFIER NULL,
    [Broker]          NVARCHAR (50)    NULL,
    [Phone]           NVARCHAR (20)    NULL,
    [Rating]          INT              NULL,
    [Comments]        NVARCHAR (500)   NULL,
    CONSTRAINT [PK_Security] PRIMARY KEY CLUSTERED ([SecurityId] ASC),
    CONSTRAINT [FK_Security_InvestingGoal] FOREIGN KEY ([InvestingGoalId]) REFERENCES [dbo].[InvestingGoal] ([InvestingGoalId]),
    CONSTRAINT [FK_Security_SecurityType] FOREIGN KEY ([SecurityTypeId]) REFERENCES [dbo].[SecurityType] ([SecurityTypeId])
);

