SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

USE [testdatabaseone]; DBCC SHRINKFILE (N'testdatabaseone_log' , 0);
USE [testdatabasetwo]; DBCC SHRINKFILE (N'testdatabasetwo_log' , 0);