CREATE PROCEDURE [dbo].[sp_WriteInvestingGoal] @Name nvarchar(100), @Description nvarchar(500) = NULL, @InvestingGoalId uniqueidentifier = NULL

AS

BEGIN

	IF @InvestingGoalId IS NULL 
		INSERT InvestingGoal
		(Name, Description)
		VALUES
		(@Name, @Description)

	ELSE

		UPDATE InvestingGoal
		SET Name = @Name, Description = @Description
		WHERE 
		InvestingGoalId = @InvestingGoalId

END