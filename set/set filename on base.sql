SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

ALTER DATABASE [testdatabaseone] MODIFY FILE (NAME=N'testdatabaseoneany'    , NEWNAME=N'testdatabaseone'    );
ALTER DATABASE [testdatabaseone] MODIFY FILE (NAME=N'testdatabaseoneany_log', NEWNAME=N'testdatabaseone_log');
ALTER DATABASE [testdatabasetwo] MODIFY FILE (NAME=N'testdatabasetwoany'    , NEWNAME=N'testdatabasetwo'    );
ALTER DATABASE [testdatabasetwo] MODIFY FILE (NAME=N'testdatabasetwoany_log', NEWNAME=N'testdatabasetwo_log');