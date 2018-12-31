CREATE PROCEDURE [dbo].[sp_WriteTag]
	@Name nvarchar(100),
	@Description nvarchar(500),
	@CopyNumber int = NULL,
	@TagId uniqueidentifier = NULL
AS
	IF @TagId = NULL	
		INSERT INTO dbo.Tag
		(
		Name,
		Description,
		CopyNumber
		)
		VALUES
		(
		@Name,
		@Description,
		@CopyNumber
		)
	ELSE
		UPDATE dbo.Tag
		SET Name = @Name, Description = @Description, CopyNumber = @CopyNumber
		WHERE TagId = @TagId
	
