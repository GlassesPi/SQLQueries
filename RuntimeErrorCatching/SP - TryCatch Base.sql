BEGIN TRY
	PRINT 1
END TRY
BEGIN CATCH
INSERT INTO dbo.RuntimeErrors
	(
		SchemaName,
		ObjectName,
		ErrorNumber,
		ErrorMessage,
		ErrorSeverity,
		ErrorState,
		ErrorProcedure,
		ErrorLine,
		Time
	)
VALUES
	(
		OBJECT_SCHEMA_NAME(@@PROCID),
		OBJECT_NAME(@@PROCID),
		ERROR_NUMBER(),
		ERROR_MESSAGE(),
		ERROR_SEVERITY(),
		ERROR_STATE(),
		ERROR_PROCEDURE(),
		ERROR_LINE(),
		GETDATE()
	)
END CATCH