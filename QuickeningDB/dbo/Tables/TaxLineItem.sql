CREATE TABLE [dbo].[TaxLineItem] (
    [TaxLineItemId] UNIQUEIDENTIFIER CONSTRAINT [DF_TaxLineItem_TaxLineItemId] DEFAULT (newid()) NOT NULL,
    [Name]          NVARCHAR (100)   NOT NULL,
    [Description]   NVARCHAR (500)   NULL,
	[EnteredDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    [LastModifiedDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    CONSTRAINT [PK_TaxLineItem] PRIMARY KEY CLUSTERED ([TaxLineItemId] ASC)
);

GO 

CREATE TRIGGER tru_TaxLineItem_UpdateLastModified
ON dbo.TaxLineItem
AFTER UPDATE
AS
    UPDATE dbo.TaxLineItem
    SET LastModifiedDateTime = GETDATE()
    WHERE TaxLineItemId IN (SELECT DISTINCT TaxLineItemId FROM Inserted)