SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

USE testdatabaseone;

DECLARE @table_name varchar(100);
DECLARE c CURSOR FOR
    SELECT  [name]
    FROM    dbo.sysobjects
    WHERE   OBJECTPROPERTY(id, N'IsUserTable') = 1
FOR READ ONLY;

CREATE TABLE _table (
    _name     varchar(100),
    _row      int         ,
    _reserved varchar(100),
    _data     varchar(100),
    _index    varchar(100),
    _empty    varchar(100)
) ON [PRIMARY];

OPEN c;
FETCH NEXT FROM c INTO @table_name;
WHILE (@@Fetch_Status >= 0)
BEGIN
    INSERT dbo._table
    EXEC sp_spaceused @table_name;
    FETCH NEXT FROM c INTO @table_name;
END
CLOSE c;
DEALLOCATE c;

SELECT
    _name     AS [table    ],
    _row      AS [row      ],
    _reserved AS [reserved ],
    _data     AS [data     ],
    _index    AS [index    ],
    _empty    AS [empty    ]
FROM dbo._table
WHERE _row > 1000000
ORDER BY _row DESC;

DROP TABLE dbo._table;