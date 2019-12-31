CREATE TABLE [dbo].[AssetClass] (
    [AssetClassId]   UNIQUEIDENTIFIER CONSTRAINT [DF_AssetClass_AssetClassId] DEFAULT (newid()) NOT NULL,
    [Name]           NVARCHAR (100)   NOT NULL,
    [Description]    NVARCHAR (500)   NULL,
    [SystemRequired] BIT              CONSTRAINT [DF_AssetClass_SystemRequired] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_AssetClass] PRIMARY KEY CLUSTERED ([AssetClassId] ASC)
);

