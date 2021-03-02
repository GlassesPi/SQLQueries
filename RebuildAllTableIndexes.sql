Use DATABASE_NAME

DROP TABLE IF EXISTS #temp

Declare @TBname nvarchar(255),
        @schema nvarchar(255),
        @SQL nvarchar(max),
		@MinRow BIGINT,
		@MaxRow BIGINT

SELECT
    ROW_NUMBER() OVER (ORDER BY t.TABLE_NAME ASC ) AS Id, *
INTO
	#temp
FROM
    INFORMATION_SCHEMA.TABLES AS t
WHERE
    t.TABLE_TYPE = 'BASE TABLE'
	

SELECT
	@MinRow = MIN(Id),
	@MaxRow = MAX(Id)
FROM
	#temp AS t

PRINT 'Total tables: ' + CAST(@MaxRow AS VARCHAR(MAX))
while @MinRow <= @MaxRow
BEGIN
	SELECT @schema = t.TABLE_SCHEMA, @TBname = t.TABLE_NAME FROM #temp AS t WHERE t.Id = @MinRow
	SET @MinRow = @MinRow + 1
	PRINT CAST(@MinRow AS VARCHAR(MAX)) +'. ' + CAST(@SQL AS VARCHAR(MAX))
	set @SQL='ALTER INDEX ALL ON [' + @schema + '].[' + @TBname + '] REBUILD;'
    EXEC SP_EXECUTESQL @SQL
END

