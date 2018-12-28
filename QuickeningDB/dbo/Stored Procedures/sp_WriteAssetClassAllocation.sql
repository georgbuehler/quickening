CREATE PROCEDURE sp_WriteAssetClassAllocation @Allocations AssetClassAllocationType READONLY

AS

BEGIN
	
	-- Confirm that allocations add up to 100%
	DECLARE @TotalAllocations decimal(16,2) 
	DECLARE @SecurityId uniqueidentifier

	SELECT 
	@TotalAllocations = SUM(Allocation),
	@SecurityId = MAX(SecurityId)
	FROM @Allocations

	IF @TotalAllocations = 100
		BEGIN
			-- Remove old allocations
			DELETE AssetClassAllocation
			WHERE SecurityId = @SecurityId

			-- Insert new allocations
			INSERT AssetClassAllocation
			(SecurityId, AssetClassId, Allocation)
			SELECT * FROM @Allocations

			RETURN 0
		END

	ELSE RETURN -1


END