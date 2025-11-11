

/********************************************************************************************************/ 
/****************************************  STORED PROCEDURE *********************************************/ 
/********************************************************************************************************/ 


/*****************************************************************************************************
   Procedure Name      : [SP_ProductionTicketOEE]
   Created By          : Gilbert Silvestre
   Created Date        : 10/01/2025
   Last Modified By    : 
   Last Modified Date  : 
   Synopsis            : 
*****************************************************************************************************/

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SP_ProductionTicketOEE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[SP_ProductionTicketOEE]
GO

--EXEC SP_ProductionTicketOEE 'DS', '10/04/2025', 'CHOCOLATE'
--EXEC SP_ProductionTicketOEE 'DS', '10/03/2025', 'MARSHMALLOW'
CREATE PROCEDURE [dbo].[SP_ProductionTicketOEE]
@Shift NVARCHAR(30) = NULL,
@Date DATETIME = NULL,
@Category NVARCHAR(20) = NULL

WITH ENCRYPTION
AS
SET QUOTED_IDENTIFIER OFF
SET ANSI_NULLS ON
SET NOCOUNT ON 

BEGIN TRANSACTION 

    SELECT
        PT.Id,
        PT.Category,
        PT.Date,
        'DS' AS Shift,
        PM.Text AS Machine,
        'BATCH' AS UOM,
        (
            SELECT STRING_AGG(value, ' / ')
            FROM (
                SELECT DISTINCT value
                FROM vw_ProductionTicketDetails
                WHERE Fieldname = 'Product Name/Customer'
                    AND Category = 'DETAILS'
                    AND TicketId = PT.Id
            ) AS x
        ) AS Product,
        (
            SELECT Firstname + ' ' + Lastname
            FROM Employees
            WHERE Id = PT.Operator
        ) AS AssignedPersonnel,
        340 AS WtPerCaseBatchBag,
        1 AS SchdNoPersonnel,
        1 AS ActlNoPersonnel,

        ISNULL(340 * vwpdbtc.BatchCount, 0) AS QuotaKG,

        (340 * vwpdbtc.BatchCount) / NULLIF(340 * ISNULL(TRY_CAST(PT.AVActualOperatingTime AS DECIMAL(18,2)),0),0) AS IdealRunRate,

        ISNULL(TRY_CAST(PT.AVPlannedOperatingTime AS DECIMAL(18,2)),0) AS AVPlannedOperatingTime,
        ISNULL(TRY_CAST(PT.AVDownTime AS DECIMAL(18,2)),0) AS AVDownTime,

        (ISNULL(TRY_CAST(PT.AVPlannedOperatingTime AS DECIMAL(18,2)),0) - ISNULL(TRY_CAST(PT.AVDownTime AS DECIMAL(18,2)),0)) AS AVActualOperatingTime,

        ((ISNULL(TRY_CAST(PT.AVPlannedOperatingTime AS DECIMAL(18,2)),0) - ISNULL(TRY_CAST(PT.AVDownTime AS DECIMAL(18,2)),0)) 
            / NULLIF(ISNULL(TRY_CAST(PT.AVPlannedOperatingTime AS DECIMAL(18,2)),0),0)) * 100 AS AVAvailability,

        '' AS AVRemarks,

        ((340 * vwpdbtc.BatchCount) / NULLIF(340 * ISNULL(TRY_CAST(PT.AVActualOperatingTime AS DECIMAL(18,2)),0),0)) * 
            (ISNULL(TRY_CAST(PT.AVPlannedOperatingTime AS DECIMAL(18,2)),0) - ISNULL(TRY_CAST(PT.AVDownTime AS DECIMAL(18,2)),0)) AS PRExpectedOutputCS,

        ((340 * vwpdbtc.BatchCount) / NULLIF(340 * ISNULL(TRY_CAST(PT.AVActualOperatingTime AS DECIMAL(18,2)),0),0)) * 
            (ISNULL(TRY_CAST(PT.AVPlannedOperatingTime AS DECIMAL(18,2)),0) - ISNULL(TRY_CAST(PT.AVDownTime AS DECIMAL(18,2)),0)) * 340 AS PRExpectedOutputKG,

        vwpdbtc.BatchCount AS PRActualOutput,
        340 * vwpdbtc.BatchCount AS PRActualOutputKG,

        vwpdbtc.BatchCount / NULLIF((ISNULL(TRY_CAST(PT.AVPlannedOperatingTime AS DECIMAL(18,2)),0) - ISNULL(TRY_CAST(PT.AVDownTime AS DECIMAL(18,2)),0)),0) AS PRActualRunRate,

        (
            (vwpdbtc.BatchCount / NULLIF((ISNULL(TRY_CAST(PT.AVPlannedOperatingTime AS DECIMAL(18,2)),0) - ISNULL(TRY_CAST(PT.AVDownTime AS DECIMAL(18,2)),0)),0))
            /
            ((340 * vwpdbtc.BatchCount) / NULLIF(340 * ISNULL(TRY_CAST(PT.AVActualOperatingTime AS DECIMAL(18,2)),0),0)) * 100
        ) AS PRPerformance,

        '' AS PRRemarks,

        (ISNULL(TRY_CAST(PT.OPPrdctnRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPTrneOptr AS DECIMAL(18,2)),0) +
         ISNULL(TRY_CAST(PT.OPRPInPrcDfcts AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPMchnFailr AS DECIMAL(18,2)),0) +
         ISNULL(TRY_CAST(PT.OPStartpRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPShtdwnCln AS DECIMAL(18,2)),0) +
         ISNULL(TRY_CAST(PT.OPCnvrsn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPOthrs AS DECIMAL(18,2)),0)) AS PSOffspecsKG,

        ((ISNULL(TRY_CAST(PT.OPPrdctnRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPTrneOptr AS DECIMAL(18,2)),0) +
          ISNULL(TRY_CAST(PT.OPRPInPrcDfcts AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPMchnFailr AS DECIMAL(18,2)),0) +
          ISNULL(TRY_CAST(PT.OPStartpRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPShtdwnCln AS DECIMAL(18,2)),0) +
          ISNULL(TRY_CAST(PT.OPCnvrsn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPOthrs AS DECIMAL(18,2)),0))
          / NULLIF((340 * vwpdbtc.BatchCount),0)) * 100 AS PSOffspecsPercentage,

        (ISNULL(TRY_CAST(PT.DPPrdctnRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPTrneOptr AS DECIMAL(18,2)),0) +
         ISNULL(TRY_CAST(PT.DPMchnFailr AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPSpilge AS DECIMAL(18,2)),0) +
         ISNULL(TRY_CAST(PT.DPStartpRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPShtdwnCln AS DECIMAL(18,2)),0) +
         ISNULL(TRY_CAST(PT.DPCnvrsn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPOthrs AS DECIMAL(18,2)),0)) AS PSDirtyProductsKG,

        ((ISNULL(TRY_CAST(PT.DPPrdctnRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPTrneOptr AS DECIMAL(18,2)),0) +
          ISNULL(TRY_CAST(PT.DPMchnFailr AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPSpilge AS DECIMAL(18,2)),0) +
          ISNULL(TRY_CAST(PT.DPStartpRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPShtdwnCln AS DECIMAL(18,2)),0) +
          ISNULL(TRY_CAST(PT.DPCnvrsn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPOthrs AS DECIMAL(18,2)),0))
          / NULLIF((340 * vwpdbtc.BatchCount),0)) * 100 AS PSDirtyProductsPercentage,

        0 AS QLFilmFoilKG,
        0 AS QLEmptyFilmKG,
        0 AS QLDefoiledFilmKG,
        0 AS QLFilmScrap,
        0 AS QLTotalPolybagUsed,

        (ISNULL(TRY_CAST(PT.OPPrdctnRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPTrneOptr AS DECIMAL(18,2)),0) +
         ISNULL(TRY_CAST(PT.OPRPInPrcDfcts AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPMchnFailr AS DECIMAL(18,2)),0) +
         ISNULL(TRY_CAST(PT.OPStartpRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPShtdwnCln AS DECIMAL(18,2)),0) +
         ISNULL(TRY_CAST(PT.OPCnvrsn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPOthrs AS DECIMAL(18,2)),0) +
         ISNULL(TRY_CAST(PT.DPPrdctnRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPTrneOptr AS DECIMAL(18,2)),0) +
         ISNULL(TRY_CAST(PT.DPMchnFailr AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPSpilge AS DECIMAL(18,2)),0) +
         ISNULL(TRY_CAST(PT.DPStartpRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPShtdwnCln AS DECIMAL(18,2)),0) +
         ISNULL(TRY_CAST(PT.DPCnvrsn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPOthrs AS DECIMAL(18,2)),0) + (340 * vwpdbtc.BatchCount)) AS QLTotalOutput,

        ((340 * vwpdbtc.BatchCount) / NULLIF(
            (ISNULL(TRY_CAST(PT.OPPrdctnRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPTrneOptr AS DECIMAL(18,2)),0) +
             ISNULL(TRY_CAST(PT.OPRPInPrcDfcts AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPMchnFailr AS DECIMAL(18,2)),0) +
             ISNULL(TRY_CAST(PT.OPStartpRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPShtdwnCln AS DECIMAL(18,2)),0) +
             ISNULL(TRY_CAST(PT.OPCnvrsn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPOthrs AS DECIMAL(18,2)),0) +
             ISNULL(TRY_CAST(PT.DPPrdctnRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPTrneOptr AS DECIMAL(18,2)),0) +
             ISNULL(TRY_CAST(PT.DPMchnFailr AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPSpilge AS DECIMAL(18,2)),0) +
             ISNULL(TRY_CAST(PT.DPStartpRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPShtdwnCln AS DECIMAL(18,2)),0) +
             ISNULL(TRY_CAST(PT.DPCnvrsn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPOthrs AS DECIMAL(18,2)),0) + (340 * vwpdbtc.BatchCount)),0)
        ) * 100 AS QLTotalOutputPercentage,

        '' AS QLRemarks,

        (
            (
                (ISNULL(TRY_CAST(PT.AVPlannedOperatingTime AS DECIMAL(18,2)),0) - ISNULL(TRY_CAST(PT.AVDownTime AS DECIMAL(18,2)),0)) 
                / NULLIF(ISNULL(TRY_CAST(PT.AVPlannedOperatingTime AS DECIMAL(18,2)),0),0)
            )
            *
            (
                (vwpdbtc.BatchCount / NULLIF((ISNULL(TRY_CAST(PT.AVPlannedOperatingTime AS DECIMAL(18,2)),0) - ISNULL(TRY_CAST(PT.AVDownTime AS DECIMAL(18,2)),0)),0)) /
                ((340 * vwpdbtc.BatchCount) / NULLIF(340 * ISNULL(TRY_CAST(PT.AVActualOperatingTime AS DECIMAL(18,2)),0),0))
            )
            *
            (
                (340 * vwpdbtc.BatchCount) / NULLIF(
                    (ISNULL(TRY_CAST(PT.OPPrdctnRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPTrneOptr AS DECIMAL(18,2)),0) +
                     ISNULL(TRY_CAST(PT.OPRPInPrcDfcts AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPMchnFailr AS DECIMAL(18,2)),0) +
                     ISNULL(TRY_CAST(PT.OPStartpRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPShtdwnCln AS DECIMAL(18,2)),0) +
                     ISNULL(TRY_CAST(PT.OPCnvrsn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.OPOthrs AS DECIMAL(18,2)),0) +
                     ISNULL(TRY_CAST(PT.DPPrdctnRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPTrneOptr AS DECIMAL(18,2)),0) +
                     ISNULL(TRY_CAST(PT.DPMchnFailr AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPSpilge AS DECIMAL(18,2)),0) +
                     ISNULL(TRY_CAST(PT.DPStartpRjctn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPShtdwnCln AS DECIMAL(18,2)),0) +
                     ISNULL(TRY_CAST(PT.DPCnvrsn AS DECIMAL(18,2)),0) + ISNULL(TRY_CAST(PT.DPOthrs AS DECIMAL(18,2)),0) + (340 * vwpdbtc.BatchCount)),0)
            )
        ) * 100 AS OEE,

        '' AS OEERemarks
    FROM ProductionTicket PT
    LEFT JOIN (
        SELECT * 
        FROM PicklistSets
        WHERE Name IN ('ProductionTicketMachine', 'ProductionTicketChocolateMachine')
    ) PM ON PM.Value = PT.MachineName
    LEFT JOIN (
        SELECT TicketId, COUNT(value) AS BatchCount
        FROM vw_ProductionTicketDetails
        WHERE Fieldname = 'Batch #'
          AND Category = 'DETAILS'
        GROUP BY TicketId
    ) vwpdbtc ON vwpdbtc.TicketId = PT.Id
    WHERE 
       PT.Date = @Date
      AND PT.Shift = @Shift
      AND (
            @Category IS NULL
            OR (
                LOWER(LTRIM(RTRIM(@Category))) = 'chocolate'
                AND LOWER(LTRIM(RTRIM(PT.Category))) = 'chocolate'
                AND LTRIM(RTRIM(PT.Process)) IN ('CBPR', 'CRLI', 'WRPT')
            )
            OR (
                LOWER(LTRIM(RTRIM(@Category))) = 'marshmallow'
                AND LOWER(LTRIM(RTRIM(PT.Category))) = 'marshmallow'
                AND LTRIM(RTRIM(PT.Process)) IN ('XNSP')
            )
        );


COMMIT TRANSACTION 

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO