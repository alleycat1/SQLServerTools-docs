-- =============================================================================================================
-- Author:		Permitin Y.A. (ypermitin@yandex.ru)
-- Create date: 2018-10-15
-- Description:	Представление для просмотра ошибок в логах
-- =============================================================================================================
CREATE VIEW [dbo].[ErrorLog]
AS
SELECT
  [ID]
 ,[DatabaseName]
 ,[TableName]
 ,[Message]
 ,[Command]
 ,[Severity]
 ,[Period]
 ,[IndexName]
FROM [dbo].[EventLog]
WHERE [Severity] = 'ERROR'
GO
