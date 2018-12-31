CREATE PROCEDURE [dbo].[sp_WriteAccount]
	@Name nvarchar(500),
    @AccountTypeId uniqueidentifier,
	@Description nvarchar(500) = NULL,
    @TaxDeferred bit = 0,
    @InterestRate decimal(16,2) = NULL,
    @FinancialInstitution nvarchar(100) = NULL,
    @RoutingNumber nvarchar(10) = NULL,
    @CustomerId nvarchar(50) = NULL,
    @ContactName nvarchar(100) = NULL,
    @Phone nvarchar(20) = NULL,
    @HomePage nvarchar(200) = NULL,
    @Comments nvarchar(500) = NULL,
    @SeparateAccount bit = 0,
    @HideAccountInList bit = 0,
    @HideAccountInTransactions bit = 0,
    @AccountGroupId uniqueidentifier = NULL,
    @ParentAccountId uniqueidentifier = NULL,
    @SecurityId uniqueidentifier = NULL,
    @TaxLineItemId uniqueidentifier = NULL,
	@AccountId uniqueidentifier = NULL
AS

IF @AccountId = NULL

	INSERT INTO [dbo].[Account]
			   (
			   [Name]
			   ,[AccountTypeId]
			   ,[Description]
			   ,[TaxDeferred]
			   ,[InterestRate]
			   ,[FinancialInstitution]
			   ,[RoutingNumber]
			   ,[CustomerId]
			   ,[ContactName]
			   ,[Phone]
			   ,[HomePage]
			   ,[Comments]
			   ,[SeparateAccount]
			   ,[HideAccountInList]
			   ,[HideAccountInTransactions]
			   ,[AccountGroupId]
			   ,[ParentAccountId]
			   ,[SecurityId]
			   ,[TaxLineItemId]
			   )
		 VALUES
			   (
			   @Name
			   ,@AccountTypeId
			   ,@Description
			   ,@TaxDeferred
			   ,@InterestRate
			   ,@FinancialInstitution
			   ,@RoutingNumber
			   ,@CustomerId
			   ,@ContactName
			   ,@Phone
			   ,@HomePage
			   ,@Comments
			   ,@SeparateAccount
			   ,@HideAccountInList
			   ,@HideAccountInTransactions
			   ,@AccountGroupId
			   ,@ParentAccountId
			   ,@SecurityId
			   ,@TaxLineItemId
			   )

ELSE
	UPDATE [dbo].[Account]
	SET 
	Name = COALESCE(@Name, Name),
	AccountTypeId = COALESCE(@AccountTypeId, AccountTypeId),
	Description = CASE @Description WHEN NULL THEN Description ELSE @Description END,
	TaxDeferred = CASE @TaxDeferred WHEN NULL THEN TaxDeferred ELSE @TaxDeferred END,
	InterestRate = CASE @InterestRate WHEN NULL THEN InterestRate ELSE @InterestRate END,
	FinancialInstitution = CASE @FinancialInstitution WHEN NULL THEN FinancialInstitution ELSE @FinancialInstitution END,
	RoutingNumber = CASE @RoutingNumber WHEN NULL THEN RoutingNumber ELSE @RoutingNumber END,
	CustomerId = CASE @CustomerId WHEN NULL THEN CustomerId ELSE @CustomerId END,
	ContactName = CASE @ContactName WHEN NULL THEN ContactName ELSE @ContactName END,
	Phone = CASE @Phone WHEN NULL THEN Phone ELSE @Phone END,
	HomePage = CASE @HomePage WHEN NULL THEN HomePage ELSE @HomePage END,
	Comments = CASE @Comments WHEN NULL THEN Comments ELSE @Comments END,
	SeparateAccount = CASE @SeparateAccount WHEN NUll THEN SeparateAccount ELSE @SeparateAccount END,
	HideAccountInList = CASE @HideAccountInList WHEN NULL THEN HideAccountInList ELSE @HideAccountInList END,
	HideAccountInTransactions = CASE @HideAccountInList WHEN NULL THEN HideAccountInTransactions ELSE @HideAccountInTransactions END,
	AccountGroupId = CASE @AccountGroupId WHEN NULL THEN AccountGroupId ELSE @AccountGroupId END,
	ParentAccountId = CASE @ParentAccountId WHEN NULL THEN ParentAccountId ELSE @ParentAccountId END,
	SecurityId = CASE @SecurityId WHEN NULL THEN SecurityId ELSE @SecurityId END,
	TaxLineItemId = CASE @TaxLineItemId WHEN NULL THEN TaxLineItemId ELSE @TaxLineItemId END
	WHERE
	AccountId = @AccountId

GO

