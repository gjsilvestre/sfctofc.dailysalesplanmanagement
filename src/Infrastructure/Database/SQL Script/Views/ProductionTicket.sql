
/********************************************************************************************************/ 
/*********************************************** VIEWS **************************************************/ 
/********************************************************************************************************/ 

/*****************************************************************************************************
   Procedure Name      : [VW_ProductionTicketDetails]
   Created By          : Gilbert Silvestre
   Created Date        : 10/01/2025
   Last Modified By    : 
   Last Modified Date  : 
   Synopsis            : 
*****************************************************************************************************/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[vw_ProductionTicketDetails]') AND OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[VW_ProductionTicketDetails]
GO

CREATE VIEW [dbo].[VW_ProductionTicketDetails]
WITH ENCRYPTION 
AS

	SELECT pd.Id AS Id, pd.TicketId AS TicketId, pt.Process AS Process,  pd.Category AS Category, pd.Fieldname AS Fieldname, pd.ColumnValue01 AS value, 'ColumnValue01' AS BatchColumn FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue01 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue02 AS value, 'ColumnValue02' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue02 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue03 AS value, 'ColumnValue03' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue03 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue04 AS value, 'ColumnValue04' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue04 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue05 AS value, 'ColumnValue05' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue05 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue06 AS value, 'ColumnValue06' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue06 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue07 AS value, 'ColumnValue07' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue07 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue08 AS value, 'ColumnValue08' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue08 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue09 AS value, 'ColumnValue09' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue09 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue10 AS value, 'ColumnValue10' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue10 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue11 AS value, 'ColumnValue11' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue11 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue12 AS value, 'ColumnValue12' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue12 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue13 AS value, 'ColumnValue13' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue13 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue14 AS value, 'ColumnValue14' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue14 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue15 AS value, 'ColumnValue15' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue15 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue16 AS value, 'ColumnValue16' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue16 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue17 AS value, 'ColumnValue17' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue17 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue18 AS value, 'ColumnValue18' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue18 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue19 AS value, 'ColumnValue19' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue19 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue20 AS value, 'ColumnValue20' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue20 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue21 AS value, 'ColumnValue21' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue21 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue22 AS value, 'ColumnValue22' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue22 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue23 AS value, 'ColumnValue23' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue23 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue24 AS value, 'ColumnValue24' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue24 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue25 AS value, 'ColumnValue25' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue25 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue26 AS value, 'ColumnValue26' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue26 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue27 AS value, 'ColumnValue27' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue27 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue28 AS value, 'ColumnValue28' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue28 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue29 AS value, 'ColumnValue29' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue29 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )
	UNION ALL SELECT pd.Id, pd.TicketId, pt.Process, pd.Category, pd.Fieldname,  pd.ColumnValue30 AS value, 'ColumnValue30' FROM ProductionTicketDetails pd JOIN ProductionTicket pt ON pt.Id = pd.TicketId WHERE pd.ColumnValue30 <> '' AND pd.TicketId IN ( SELECT DISTINCT Id  FROM ProductionTicket )

GO
