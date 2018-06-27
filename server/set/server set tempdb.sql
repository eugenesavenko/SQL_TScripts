SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

USE [master];
ALTER DATABASE tempdb MODIFY FILE (NAME = tempdb_1   , FILENAME = 'd:\mdf\tempdb_1.mdf');
ALTER DATABASE tempdb MODIFY FILE (NAME = tempdb_log , FILENAME = 'd:\ldf\tempdb_log.ldf');
ALTER DATABASE tempdb MODIFY FILE (NAME = tempdb_2   , FILENAME = 'd:\ndf\tempdb_2.ndf');
ALTER DATABASE tempdb MODIFY FILE (NAME = tempdb_3   , FILENAME = 'd:\ndf\tempdb_3.ndf');
ALTER DATABASE tempdb MODIFY FILE (NAME = tempdb_4   , FILENAME = 'd:\ndf\tempdb_4.ndf');
ALTER DATABASE tempdb MODIFY FILE (NAME = tempdb_5   , FILENAME = 'd:\ndf\tempdb_5.ndf');
ALTER DATABASE tempdb MODIFY FILE (NAME = tempdb_6   , FILENAME = 'd:\ndf\tempdb_6.ndf');
ALTER DATABASE tempdb MODIFY FILE (NAME = tempdb_7   , FILENAME = 'd:\ndf\tempdb_7.ndf');
ALTER DATABASE tempdb MODIFY FILE (NAME = tempdb_8   , FILENAME = 'd:\ndf\tempdb_8.ndf');