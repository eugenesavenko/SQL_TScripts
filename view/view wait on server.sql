SET ANSI_NULLS        ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET NOCOUNT           ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

SELECT TOP 10
    wait_type                                 AS [type   ],
    wait_time_ms/1000                         AS [second ],
    wait_time_ms/60000                        AS [minute ],
    wait_time_ms/3600000                      AS [hour   ],
    wait_time_ms/86400000                     AS [day    ],
    wait_time_ms*100/SUM(wait_time_ms) OVER() AS [percent] 
FROM  sys.dm_os_wait_stats
WHERE wait_type NOT LIKE '%SLEEP%'
ORDER BY wait_time_ms DESC;