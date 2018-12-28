
CREATE PROCEDURE sp_WriteSecurityPriceHistory @PriceDateTime datetime, @SecurityId uniqueidentifier, @Price money, @SecurityPriceHistoryId uniqueidentifier = NULL

AS

IF @SecurityPriceHistoryId IS NULL
	BEGIN

		INSERT INTO [dbo].[SecurityPriceHistory]
			   (
			   [PriceDateTime]
			   ,[SecurityId]
			   ,[Price]
			   )
		 VALUES
			   (
			   @PriceDateTime
			   ,@SecurityId
			   ,@Price
			   )
	END

ELSE

	UPDATE [SecurityPriceHistory]
	SET PriceDateTime = @PriceDateTime, SecurityId = @SecurityId, Price = @Price
	WHERE
	SecurityPriceHistoryId = @SecurityPriceHistoryId

