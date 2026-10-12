# SQL Server Database Integrity Checks

Practical guidance and diagnostic examples for investigating SQL Server database consistency errors, checking database integrity, and planning safe recovery.

This repository is an educational reference for database administrators and developers troubleshooting SQL Server database issues.

## What You'll Find

- How to investigate SQL Server database corruption symptoms
- How to use `DBCC CHECKDB` to check database integrity
- How to interpret consistency-check results
- How to investigate possible storage and I/O problems
- How to evaluate backups before considering repair
- A checklist for validating a database after recovery
- [Database integrity check SQL script](check-database-integrity.sql) — a diagnostic example using `DBCC CHECKDB`.

## 1. Check Database Integrity

SQL Server provides `DBCC CHECKDB` to check the logical and physical integrity of database objects.

Example:

```sql
DBCC CHECKDB (N'YourDatabase')
WITH NO_INFOMSGS, ALL_ERRORMSGS;
```

Replace `YourDatabase` with the name of the database you intend to check.

**Important:** Run integrity checks with appropriate permissions and consider their resource impact on production systems. Review the complete output and follow your organization's maintenance procedures.

For syntax, options, and limitations, consult the official [Microsoft DBCC CHECKDB documentation](https://learn.microsoft.com/en-us/sql/t-sql/database-console-commands/dbcc-checkdb-transact-sql).

## How to Use the Script

1. Open [`check-database-integrity.sql`](check-database-integrity.sql).
2. Review the script before running it in SQL Server Management Studio (SSMS) or another compatible SQL Server query editor.
3. Replace `YourDatabase` with the name of the database you want to check.
4. Confirm that you have the required permissions and that the check is appropriate for your environment.
5. Execute the script and review the complete output for reported consistency errors.

**Note:** `DBCC CHECKDB` performs an integrity check; it does not repair the database. It can consume significant system resources, so consider the impact before running it against a production database.

## 2. Investigate Errors Before Repair

If a consistency check reports errors:

1. Save the complete output and note the affected database objects or pages.
2. Review SQL Server error logs and relevant operating system or storage events.
3. Investigate possible hardware, storage, or I/O problems.
4. Identify available backups and determine whether they can be restored.
5. Preserve the original database files before attempting recovery.

Do not assume that every database-access error indicates corruption. Permissions, unavailable storage, and configuration problems can also prevent access.

See Microsoft's guide to [troubleshooting database consistency errors](https://learn.microsoft.com/en-us/troubleshoot/sql/database-engine/database-file-operations/troubleshoot-dbcc-checkdb-errors).

## 3. Prefer a Known-Good Backup Where Possible

Restoring from a known-good backup is generally the preferred way to address database consistency errors.

Before restoring, identify the recovery point required, verify which backups and transaction logs are available, and test the restore process where possible.

Repair options require careful consideration. In particular, `REPAIR_ALLOW_DATA_LOSS` can discard damaged data and should not be treated as a routine first step.

## 4. Post-Recovery Validation Checklist

- [ ] Review the original error messages and diagnostic output.
- [ ] Investigate the underlying cause of the incident.
- [ ] Confirm the recovery method and recovery point.
- [ ] Run appropriate integrity checks after recovery.
- [ ] Validate important tables, records, relationships, and application workflows.
- [ ] Review the backup and restore strategy.

## Further Reading

- [Microsoft: DBCC CHECKDB documentation](https://learn.microsoft.com/en-us/sql/t-sql/database-console-commands/dbcc-checkdb-transact-sql)
- [Microsoft: Troubleshoot database consistency errors](https://learn.microsoft.com/en-us/troubleshoot/sql/database-engine/database-file-operations/troubleshoot-dbcc-checkdb-errors)
- [Related tutorial: SQL Server Database Corruption — How to Diagnose Errors Before Recovery](https://dev.to/alexmorgansql/sql-server-database-corruption-how-to-diagnose-errors-before-recovery-4p22)

---

**Disclaimer:** These examples are for educational purposes. Test procedures in an appropriate environment and consult official documentation before performing recovery operations on production databases.
