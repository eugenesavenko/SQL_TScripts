-- state Состояние BPE
--     0 BPE выключено
--     1 Отключение BPE
--     2 Зарезервировано
--     3 Включение BPE
--     4 Зарезервировано
--     5 BPE включено

-- state_description Описывает состояние BPE
--                 0 BUFFER POOL EXTENSION DISABLED
--                 1 BUFFER POOL EXTENSION ENABLED

SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

--просмотр информации о конфигурации BPE
--size in gb
SELECT
    file_id                      AS id         ,
    state                        AS state      ,
    current_size_in_kb/1024/1024 AS size       ,
    path                         AS path       ,
    state_description            AS description
FROM
    sys.dm_os_buffer_pool_extension_configuration;

--количество кэшированных страниц в файле BPE
SELECT COUNT(*) AS count
FROM   sys.dm_os_buffer_descriptors
WHERE  is_in_bpool_extension <> 0;

--количество кэшированных страниц по базам
SELECT   COUNT (*) AS count,
CASE     database_id
WHEN     32767
THEN     'ResourceDb'
ELSE     db_name(database_id)
END      AS database_name
FROM     sys.dm_os_buffer_descriptors
GROUP BY DB_NAME(database_id), database_id
ORDER BY count DESC;

-- количество кэшированных страниц по объектам в базах
SELECT
    COUNT (*) AS count,
    name              ,
    index_id  AS id
FROM
    sys.dm_os_buffer_descriptors AS bd
INNER JOIN (
    SELECT
        object_name (object_id) AS name,
        index_id                       ,
        allocation_unit_id
    FROM sys.allocation_units AS au
    INNER JOIN sys.partitions AS p
    ON au.container_id = p.hobt_id
    AND (au.type = 1 OR au.type = 3)
    UNION ALL
    SELECT
        object_name(object_id) AS name,
        index_id,
        allocation_unit_id
    FROM sys.allocation_units AS au
    INNER JOIN sys.partitions AS p
    ON au.container_id = p.partition_id
    AND au.type = 2)
    AS obj
ON       bd.allocation_unit_id = obj.allocation_unit_id
WHERE    database_id = DB_ID()
GROUP BY name, index_id
ORDER BY count DESC;