CREATE PROCEDURE [dbo].[sp_WriteTaxLineItem]
	@Name nvarchar(100),
	@Description nvarchar(500) = NULL,
	@TaxLineitemId uniqueidentifier = NULL
AS

IF @TaxLineitemId IS NULL

INSERT INTO [dbo].[TaxLineItem]
           (
           [Name]
           ,[Description]
			)
     VALUES
           (
           @Name
           ,@Description
		   )

ELSE
	
	UPDATE [dbo].[TaxLineItem]
	SET Name = @Name, Description = @Description
	WHERE TaxLineItemId = @TaxLineitemId
GO

