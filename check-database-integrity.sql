/*
  SQL Server Database Integrity Check
  Purpose: Check database integrity without performing repairs.

  Review the target database and expected resource impact before running.
*/

USE [master];
GO

DECLARE @DatabaseName sysname = N'YourDatabase';

IF DB_ID(@DatabaseName) IS NULL
BEGIN
    THROW 50001, 'Database not found. Update @DatabaseName before running.', 1;
END;

DBCC CHECKDB (@DatabaseName)
WITH NO_INFOMSGS, ALL_ERRORMSGS;
GO
