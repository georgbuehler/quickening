CREATE TABLE [dbo].[InvestingGoal] (
    [InvestingGoalId] UNIQUEIDENTIFIER CONSTRAINT [DF_InvestingGoal_InvestingGoalId] DEFAULT (newid()) NOT NULL,
    [Name]            NVARCHAR (100)   NOT NULL,
    [Description]     NVARCHAR (500)   NULL,
    CONSTRAINT [PK_InvestingGoal] PRIMARY KEY CLUSTERED ([InvestingGoalId] ASC)
);

