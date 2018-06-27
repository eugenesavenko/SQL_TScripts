SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

SELECT
    database_id      AS [id        ],
    name             AS [base      ],
    physical_name    AS [file      ],
    size*8/1024/1024 AS [size in gb],
    type_desc        AS [type      ]
FROM sys.master_files
ORDER BY size DESC;