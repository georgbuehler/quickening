﻿CREATE TABLE [dbo].[TransactionRecordTag] (
    [TransactionTagId]    UNIQUEIDENTIFIER CONSTRAINT [DF_TransactionTag_TransactionTagId] DEFAULT (newid()) NOT NULL,
    [TransactionRecordId] UNIQUEIDENTIFIER NOT NULL,
    [TagId]               UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_TransactionRecordTag] PRIMARY KEY CLUSTERED ([TransactionTagId] ASC),
    CONSTRAINT [FK_TransactionRecordTag_Tag] FOREIGN KEY ([TagId]) REFERENCES [dbo].[Tag] ([TagId]),
    CONSTRAINT [FK_TransactionRecordTag_TransactionRecord] FOREIGN KEY ([TransactionRecordId]) REFERENCES [dbo].[TransactionRecord] ([TransactionRecordId])
);

