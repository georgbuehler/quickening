CREATE TABLE [dbo].[AccountGroup] (
    [AccountGroupId] UNIQUEIDENTIFIER CONSTRAINT [DF_AccountGroup_AccountGroupId] DEFAULT (newid()) NOT NULL,
    [Name]           NVARCHAR (100)   NOT NULL,
    [Description]    NVARCHAR (500)   NULL,
    [SystemRequired] BIT              CONSTRAINT [DF_AccountGroup_SystemRequired] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_AccountGroup] PRIMARY KEY CLUSTERED ([AccountGroupId] ASC)
);

