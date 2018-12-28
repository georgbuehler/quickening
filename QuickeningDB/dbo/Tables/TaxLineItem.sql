CREATE TABLE [dbo].[TaxLineItem] (
    [TaxLineItemId] UNIQUEIDENTIFIER CONSTRAINT [DF_TaxLineItem_TaxLineItemId] DEFAULT (newid()) NOT NULL,
    [Name]          NVARCHAR (100)   NOT NULL,
    [Description]   NVARCHAR (500)   NULL,
    CONSTRAINT [PK_TaxLineItem] PRIMARY KEY CLUSTERED ([TaxLineItemId] ASC)
);

