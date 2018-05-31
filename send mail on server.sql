SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

DECLARE @profile   AS NVARCHAR(max) = 'profile';
DECLARE @recipient AS NVARCHAR(max) = 'recipient@domen.com';
DECLARE @subject   AS NVARCHAR(max) = '';
DECLARE @massage   AS NVARCHAR(max) = '';

SET @subject = 'Текст темы письма ' + DB_NAME();
SET @massage = 'Текс сообщения для ' + @recipient + ' о событии в ' + DB_NAME();

EXEC msdb.dbo.sp_send_dbmail
    @profile_name = @profile  ,
    @recipient    = @recipient,
    @body         = @massage  ,
    @subject      = @subject  ;

SELECT
    @subject AS subject,
    @massage AS massage;