

CREATE PROCEDURE sp_WriteSecurity	@Name nvarchar(100), 
									@SecurityTypeId uniqueidentifier, 
									@Symbol nvarchar(10) = NULL, 
									@DownloadQuotes bit = 0,
									@WatchList bit = 0,
									@Hide bit = 0,
									@TaxFree bit = 0,
									@UseAverageCost bit = 0,
									@InvestingGoalId uniqueidentifier = null,
									@Broker nvarchar(500) = NULL,
									@Phone nvarchar(20) = NULL,
									@Rating int = NULL,
									@Comments nvarchar(500) = NULL,
									@SecurityId uniqueidentifier = null

AS

BEGIN

IF @SecurityId IS NULL

	INSERT INTO [dbo].[Security]
			   (
			   [Name]
			   ,[Symbol]
			   ,[SecurityTypeId]
			   ,[DownloadQuotes]
			   ,[WatchList]
			   ,[Hide]
			   ,[TaxFree]
			   ,[UseAverageCost]
			   ,[InvestingGoalId]
			   ,[Broker]
			   ,[Phone]
			   ,[Rating]
			   ,[Comments])
		 VALUES
			   (
			   @Name
			   ,@Symbol
			   ,@SecurityTypeId
			   ,@DownloadQuotes
			   ,@WatchList
			   ,@Hide
			   ,@TaxFree
			   ,@UseAverageCost
			   ,@InvestingGoalId
			   ,@Broker
			   ,@Phone
			   ,@Rating
			   ,@Comments
			   )

ELSE

	UPDATE [dbo].[Security]
	SET 
				[Name] = COALESCE(@Name, Name)
			   ,[Symbol] = COALESCE(@Symbol, Symbol)
			   ,[SecurityTypeId] = @SecurityTypeId
			   ,[DownloadQuotes] = CASE @DownloadQuotes WHEN NULL THEN DownloadQuotes ELSE @DownloadQuotes END
			   ,[WatchList] = CASE @WatchList WHEN NULL THEN WatchList ELSE @WatchList END
			   ,[Hide] = CASE @Hide WHEN NULL THEN Hide ELSE @Hide END
			   ,[TaxFree] = CASE @TaxFree WHEN NULL THEN TaxFree ELSE @TaxFree END
			   ,[UseAverageCost] = CASE @UseAverageCost WHEN NULL THEN UseAverageCost ELSE @UseAverageCost END
			   ,[InvestingGoalId] = CASE @InvestingGoalId WHEN NULL THEN InvestingGoalId ELSE @InvestingGoalId END
			   ,[Broker] = CASE @Broker WHEN NULL THEN Broker ELSE @Broker END
			   ,[Phone] = CASE @Phone WHEN NULL THEN Phone ELSE @Phone END
			   ,[Rating] = CASE @Rating WHEN NULL THEN Rating ELSE @Rating END
			   ,[Comments] = CASE @Comments WHEN NULL THEN Comments ELSE @Comments END
	WHERE
	SecurityId = @SecurityId


END


