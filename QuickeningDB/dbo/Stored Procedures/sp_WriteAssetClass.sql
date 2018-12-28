CREATE PROCEDURE [dbo].[sp_WriteAssetClass] @Name nvarchar(100), @Description nvarchar(500) = NULL, @SystemRequired int = 0, @AssetClassId uniqueidentifier = NULL

AS

BEGIN

	IF @AssetClassId IS NULL 
		INSERT AssetClass
		(Name, Description, SystemRequired)
		VALUES
		(@Name, @Description,@SystemRequired)

	ELSE

		UPDATE AssetClass
		SET Name = @Name, Description = @Description
		WHERE 
		AssetClassId = @AssetClassId

END