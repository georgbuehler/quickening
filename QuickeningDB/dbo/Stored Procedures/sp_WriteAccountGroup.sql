
CREATE PROCEDURE [dbo].[sp_WriteAccountGroup] @Name nvarchar(100), @Description nvarchar(500) = NULL, @SystemRequired bit = 0, @AccountGroupId uniqueidentifier = NULL

AS

BEGIN

	IF @AccountGroupId IS NULL 
		INSERT AccountGroup
		(Name, Description, SystemRequired)
		VALUES
		(@Name, @Description, @SystemRequired)

	ELSE

		UPDATE AccountGroup
		SET Name = @Name, Description = @Description
		WHERE 
		AccountGroupId = @AccountGroupId

END
