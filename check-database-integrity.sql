/*
  SQL Server Database Integrity Check
  Purpose: Run DBCC CHECKDB against a database selected by the operator.

  Review the target database and execution impact before running.
  This script performs an integrity check; it does not repair the database.
*/

USE [master];
GO

DECLARE @DatabaseName sysname = N'YourDatabase';

IF DB_ID(@DatabaseName) IS NULL
BEGIN
    THROW 50001, 'Database not found. Update @DatabaseName before running.', 1;
END;
GO

-- Replace YourDatabase with the actual database name.
-- Run this command in a suitable maintenance window if needed.
DBCC CHECKDB (N'YourDatabase')
WITH NO_INFOMSGS, ALL_ERRORMSGS;
GO


/*Important: Replace YourDatabase with the actual database name before running it. This is a diagnostic example, not a repair script. DBCC CHECKDB can consume significant resources, so consider the impact on production systems and follow your DBA team's procedures. See Microsoft's official documentation*/
