-- Анализ ошибок

CREATE EVENT SESSION [Errors] ON SERVER 
ADD EVENT sqlserver.error_reported(
    ACTION (
        sqlserver.client_app_name,
        sqlserver.client_hostname,
        sqlserver.client_pid,
        sqlserver.database_id,
        sqlserver.is_system,
        sqlserver.nt_username,
        sqlserver.server_principal_name,
        sqlserver.session_id,
        sqlserver.sql_text,
        sqlserver.transaction_id,
        sqlserver.transaction_sequence,
        sqlserver.username)
    WHERE ([severity]>(10)))
ADD TARGET package0.event_file(SET 
    -- Путь к файлу хранения логов. Если не указан, то используется путь к каталогу логов SQL Server
    filename=N'Errors.xel',
    -- Максимальный размер файла в мегабайтах
    max_file_size=(10),
    -- Максимальное количество файлов, после чего начнется перезапись логов в более старых файлах.
    max_rollover_files=(5))
WITH (
    MAX_MEMORY=4096 KB,
    EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,
    MAX_DISPATCH_LATENCY=15 SECONDS,
    MAX_EVENT_SIZE=0 KB,
    MEMORY_PARTITION_MODE=NONE,
    TRACK_CAUSALITY=OFF,
    STARTUP_STATE=OFF)


