CREATE TYPE [dbo].[AssetClassAllocationType] AS TABLE (
    [SecurityId]   UNIQUEIDENTIFIER NULL,
    [AssetClassId] UNIQUEIDENTIFIER NULL,
    [Allocation]   DECIMAL (16, 2)  NULL);

