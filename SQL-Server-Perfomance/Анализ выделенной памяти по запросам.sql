-- Анализ предоставления памяти запросам
-- https://docs.microsoft.com/ru-ru/sql/relational-databases/system-dynamic-management-views/sys-dm-exec-query-memory-grants-transact-sql?view=sql-server-ver15

SELECT
	sqltext.text AS [SqlText],
	DB_NAME(s.database_id) AS [DatabaseName],
	qerPlan.query_plan AS [SqlPlan],
	mg.session_id,
	request_id,
	scheduler_id,
	dop,
	request_time,
	grant_time,
	requested_memory_kb,
	granted_memory_kb,
	required_memory_kb,
	used_memory_kb,
	max_used_memory_kb,
	query_cost,
	timeout_sec,
	ideal_memory_kb
FROM sys.dm_exec_query_memory_grants mg
	LEFT JOIN sys.dm_exec_sessions s on mg.session_id = s.session_id
	OUTER APPLY sys.dm_exec_sql_text(mg.sql_handle) AS sqltext
	OUTER APPLY sys.dm_exec_query_plan(mg.plan_handle) qerPlan