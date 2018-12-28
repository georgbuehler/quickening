CREATE PROCEDURE [dbo].[sp_WriteSecurityType] @Name nvarchar(100), @Description nvarchar(500) = NULL, @SystemRequired bit = 0, @SecurityTypeId uniqueidentifier = NULL

AS

BEGIN

	IF @SecurityTypeId IS NULL 
		INSERT SecurityType
		(Name, Description, SystemRequired)
		VALUES
		(@Name, @Description, @SystemRequired)

	ELSE

		UPDATE SecurityType
		SET Name = @Name, Description = @Description
		WHERE 
		SecurityTypeId = @SecurityTypeId

END