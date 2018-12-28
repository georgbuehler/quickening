CREATE TABLE [dbo].[InvestingGoal] (
    [InvestingGoalId] UNIQUEIDENTIFIER CONSTRAINT [DF_InvestingGoal_InvestingGoalId] DEFAULT (newid()) NOT NULL,
    [Name]            NVARCHAR (100)   NOT NULL,
    [Description]     NVARCHAR (500)   NULL,
	[EnteredDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    [LastModifiedDateTime] DATETIME NOT NULL DEFAULT getdate(), 
    CONSTRAINT [PK_InvestingGoal] PRIMARY KEY CLUSTERED ([InvestingGoalId] ASC)
);

GO

CREATE TRIGGER tru_InvestingGoal_UpdateLastModified
ON dbo.InvestingGoal
AFTER UPDATE
AS
    UPDATE dbo.InvestingGoal
    SET LastModifiedDateTime = GETDATE()
    WHERE InvestingGoalId IN (SELECT DISTINCT InvestingGoalId FROM Inserted)