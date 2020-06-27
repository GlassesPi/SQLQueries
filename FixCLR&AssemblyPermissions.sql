/*

This is script must execute on dbs that detachad and attached previously
and returned "An error occurred in the Microsoft .NET Framework while trying to load assembly id 65558" error

*/


USE <DATABASE>;
EXEC sp_configure 'clr enabled' ,1
GO

RECONFIGURE
GO
EXEC sp_configure 'clr enabled'   -- make sure it took
GO

USE <DATABASE>
GO

EXEC sp_changedbowner 'sa'
USE <DATABASE>
GO

ALTER DATABASE <DATABASE> SET TRUSTWORTHY ON;  