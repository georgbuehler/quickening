CREATE TABLE [dbo].[AssetClassAllocation] (
    [AssetClassAllocationId] UNIQUEIDENTIFIER CONSTRAINT [DF_AssetClassAllocation_AssetClassAllocationId] DEFAULT (newid()) NOT NULL,
    [SecurityId]             UNIQUEIDENTIFIER NOT NULL,
    [AssetClassId]           UNIQUEIDENTIFIER NOT NULL,
    [Allocation]             DECIMAL (16, 2)  NOT NULL,
	[EnteredDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    [LastModifiedDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    CONSTRAINT [PK_AssetClassAllocation] PRIMARY KEY CLUSTERED ([AssetClassAllocationId] ASC),
    CONSTRAINT [FK_AssetClassAllocation_AssetClass] FOREIGN KEY ([AssetClassId]) REFERENCES [dbo].[AssetClass] ([AssetClassId]),
    CONSTRAINT [FK_AssetClassAllocation_Security] FOREIGN KEY ([SecurityId]) REFERENCES [dbo].[Security] ([SecurityId])
);

GO

CREATE TRIGGER [dbo].[tru_ASsetClassAllocation_UpdateLastModified]
    ON [dbo].[AssetClassAllocation]
    AFTER UPDATE
    AS
    UPDATE dbo.AssetClassAllocation
    SET LastModifiedDateTime = GETDATE()
    WHERE AssetClassAllocationId IN (SELECT DISTINCT AssetClassAllocationId FROM Inserted)