SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

DECLARE @base       AS VARCHAR (max) = 'testpatiobuh';
DECLARE @fragmental AS INT            = 5             ;
DECLARE @index      AS INT            = 0             ;
DECLARE @page       AS INT            = 100           ;
DECLARE @sql        AS NVARCHAR (max) = ''            ;

SET @base = 'USE ' + @base + ';';
PRINT @base;

SELECT
    OBJECT_NAME (object_id)      AS [table     ],
    object_id                    AS [object    ],
    avg_fragmentation_in_percent AS [fragmental],
    index_id                     AS [index     ],
    index_type_desc              AS [type      ],
    page_count                   AS [page      ],
    partition_number             AS [partition ]
FROM
    sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL , NULL, 'LIMITED')
WHERE    index_id > @index
AND      avg_fragmentation_in_percent > @fragmental
AND      page_count > @page
ORDER BY avg_fragmentation_in_percent DESC;