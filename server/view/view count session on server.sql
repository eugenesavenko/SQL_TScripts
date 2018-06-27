SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

SELECT
    status             AS [status],
    count (session_id) AS [total ]
FROM sys.dm_exec_sessions
GROUP BY [status];