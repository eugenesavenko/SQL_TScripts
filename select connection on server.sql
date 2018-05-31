SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;


SELECT
    program_name  AS [name    ],
    net_transport AS [protocol]
FROM sys.dm_exec_sessions AS sessions
    LEFT JOIN sys.dm_exec_connections AS connections
    ON sessions.session_id = connections.session_id
WHERE program_name IS NOT NULL
ORDER BY program_name;