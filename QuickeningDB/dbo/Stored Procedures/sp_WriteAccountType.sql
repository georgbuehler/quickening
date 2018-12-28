
CREATE PROCEDURE [dbo].[sp_WriteAccountType] @Name nvarchar(100), @Description nvarchar(500) = NULL, @SystemRequired bit = 0, @AccountTypeId uniqueidentifier = NULL

AS

BEGIN

	IF @AccountTypeId IS NULL 
		INSERT AccountType
		(Name, Description, SystemRequired)
		VALUES
		(@Name, @Description, @SystemRequired)

	ELSE

		UPDATE AccountType
		SET Name = @Name, Description = @Description
		WHERE 
		AccountTypeId = @AccountTypeId

END
