CREATE TABLE [dbo].[Tag] (
    [TagId]       UNIQUEIDENTIFIER CONSTRAINT [DF_Tag_TagId] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [Name]        NVARCHAR (50)    NOT NULL,
    [Description] NVARCHAR (500)   NULL,
    [CopyNumber]  INT              NULL,
    CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED ([TagId] ASC)
);

