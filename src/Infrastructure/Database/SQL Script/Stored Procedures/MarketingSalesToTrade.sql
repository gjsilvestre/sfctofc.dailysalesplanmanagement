/********************************************************************************************************/ 
/****************************************  STORED PROCEDURE *********************************************/ 
/********************************************************************************************************/ 

/*****************************************************************************************************
   Procedure Name      : [SP_MarketingSalesToTrade]
   Created By          : Gilbert Silvestre
   Created Date        : 10/01/2025
   Last Modified By    : 
   Last Modified Date  : 
   Synopsis            : 
*****************************************************************************************************/

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SP_MarketingSalesToTrade]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[SP_MarketingSalesToTrade]
GO

--exec SP_MarketingSalesToTrade 'CHANNELVOLUMEINAMOUNT', 'KARLAS', '', '8/1/2025', '8/31/2025'
--exec SP_MarketingSalesToTrade 'DEFAULTCHANNELS', 'KARLAS', '', '8/1/2025', '8/31/2025'

CREATE PROCEDURE [dbo].[SP_MarketingSalesToTrade] 

@Mode NVARCHAR(30),
@Distributor NVARCHAR(30),
@Region NVARCHAR(30),
@DateFrom DATETIME,
@DateTo DATETIME

WITH ENCRYPTION
AS
SET QUOTED_IDENTIFIER OFF
SET ANSI_NULLS ON
SET NOCOUNT ON 

BEGIN TRANSACTION 
    SET NOCOUNT ON;
    
     -- Normalize filters (trim + uppercase)
    SET @Distributor = UPPER(LTRIM(RTRIM(@Distributor)));
    SET @Region = UPPER(LTRIM(RTRIM(@Region)));

    -- Split the input strings into table variables
    DECLARE @DistributorList TABLE (Distributor NVARCHAR(100));
    DECLARE @RegionList TABLE (Region NVARCHAR(100));

    INSERT INTO @DistributorList
    SELECT LTRIM(RTRIM(value))
    FROM STRING_SPLIT(@Distributor, ',');

    INSERT INTO @RegionList
    SELECT LTRIM(RTRIM(value))
    FROM STRING_SPLIT(@Region, ',');


    IF (@Mode = "DEFAULTCHANNELS")
    BEGIN
        SELECT 
            S.Distributor,
            O.ChannelType
        FROM DistributorSales S
        LEFT JOIN DistributorOutlet O ON O.OutletCode = S.OutletCode AND O.Distributor = S.Distributor
        LEFT JOIN DistributorItemMapping M ON M.ItemCode = S.ItemCode AND M.Distributor = S.Distributor
        LEFT JOIN Product P ON P.SFCCode = M.SFCCode
        WHERE CAST(S.InvoiceDate AS DATE) BETWEEN @DateFrom AND @DateTo
            AND S.Distributor IS NOT NULL
            AND S.NetPrice > 0
            AND (
                @distributor = 'ALL DISTRIBUTOR'
                OR UPPER(S.Distributor) IN (SELECT Distributor FROM @DistributorList)
            )
        GROUP BY S.Distributor, O.ChannelType
    END

	IF (@Mode = "CHANNELVOLUMEINAMOUNT")
	BEGIN
		WITH BaseData AS (
            SELECT 
                S.Distributor,
                O.ChannelType,
                P.Category,
                SUM(S.NetPrice) AS VolumeInAmount
            FROM DistributorSales S
                LEFT JOIN DistributorOutlet O ON O.OutletCode = S.OutletCode AND O.Distributor = S.Distributor
                LEFT JOIN DistributorItemMapping M ON M.ItemCode = S.ItemCode AND M.Distributor = S.Distributor
                LEFT JOIN Product P ON P.SFCCode = M.SFCCode
            WHERE CAST(S.InvoiceDate AS DATE) BETWEEN @DateFrom AND @DateTo
              AND S.NetPrice > 0
              AND (
                @distributor = 'ALL DISTRIBUTOR'
                OR UPPER(S.Distributor) IN (SELECT Distributor FROM @DistributorList)
               )
            GROUP BY S.Distributor, O.ChannelType, P.Category
        ),
        Pivoted AS (
            SELECT 
                Distributor,
                ChannelType,
                ISNULL([BAKING], 0) AS [BAKING],
                ISNULL([BARLINE], 0) AS [BARLINE],
                ISNULL([CHOCOLATE], 0) AS [CHOCOLATE],
                ISNULL([GUMMY], 0) AS [GUMMY],
                ISNULL([MARSHMALLOW], 0) AS [MARSHMALLOW],
                ISNULL([PANNING], 0) AS [PANNING],
                ISNULL([PROMO], 0) AS [PROMO],
                ISNULL([RICE CRISPIES], 0) AS [RICE CRISPIES],
                ISNULL([SPECIALTY], 0) AS [SPECIALTY],
                ISNULL([TOFC CHOCOLATE], 0) AS [TOFC CHOCOLATE],
                ISNULL([UNKNOWN], 0) AS [UNKNOWN]
            FROM BaseData
            PIVOT (
                SUM(VolumeInAmount)
                FOR Category IN (
                    [BAKING],[BARLINE],[CHOCOLATE],[GUMMY],[MARSHMALLOW],
                    [PANNING],[PROMO],[RICE CRISPIES],[SPECIALTY],
                    [TOFC CHOCOLATE],[UNKNOWN]
                )
            ) AS pvt
        ),
        WithSubtotals AS (
            -- Subtotal per Distributor
            SELECT 
                Distributor,
                'ZZZ_SUBTOTAL' AS ChannelType,
                SUM([BAKING]) AS [BAKING],
                SUM([BARLINE]) AS [BARLINE],
                SUM([CHOCOLATE]) AS [CHOCOLATE],
                SUM([GUMMY]) AS [GUMMY],
                SUM([MARSHMALLOW]) AS [MARSHMALLOW],
                SUM([PANNING]) AS [PANNING],
                SUM([PROMO]) AS [PROMO],
                SUM([RICE CRISPIES]) AS [RICE CRISPIES],
                SUM([SPECIALTY]) AS [SPECIALTY],
                SUM([TOFC CHOCOLATE]) AS [TOFC CHOCOLATE],
                SUM([UNKNOWN]) AS [UNKNOWN]
            FROM Pivoted
            GROUP BY Distributor
        ),
        WithPercentages AS (
            -- % Share per Category per Distributor
            SELECT 
                Distributor,
                'AAA_% SHARE' AS ChannelType,
                CAST(
                    CASE WHEN SUM_TOTAL = 0 THEN 0 ELSE ( [BAKING] / SUM_TOTAL * 100 ) END AS DECIMAL(10,2)
                ) AS [BAKING],
                CAST(
                    CASE WHEN SUM_TOTAL = 0 THEN 0 ELSE ( [BARLINE] / SUM_TOTAL * 100 ) END AS DECIMAL(10,2)
                ) AS [BARLINE],
                CAST(
                    CASE WHEN SUM_TOTAL = 0 THEN 0 ELSE ( [CHOCOLATE] / SUM_TOTAL * 100 ) END AS DECIMAL(10,2)
                ) AS [CHOCOLATE],
                CAST(
                    CASE WHEN SUM_TOTAL = 0 THEN 0 ELSE ( [GUMMY] / SUM_TOTAL * 100 ) END AS DECIMAL(10,2)
                ) AS [GUMMY],
                CAST(
                    CASE WHEN SUM_TOTAL = 0 THEN 0 ELSE ( [MARSHMALLOW] / SUM_TOTAL * 100 ) END AS DECIMAL(10,2)
                ) AS [MARSHMALLOW],
                CAST(
                    CASE WHEN SUM_TOTAL = 0 THEN 0 ELSE ( [PANNING] / SUM_TOTAL * 100 ) END AS DECIMAL(10,2)
                ) AS [PANNING],
                CAST(
                    CASE WHEN SUM_TOTAL = 0 THEN 0 ELSE ( [PROMO] / SUM_TOTAL * 100 ) END AS DECIMAL(10,2)
                ) AS [PROMO],
                CAST(
                    CASE WHEN SUM_TOTAL = 0 THEN 0 ELSE ( [RICE CRISPIES] / SUM_TOTAL * 100 ) END AS DECIMAL(10,2)
                ) AS [RICE CRISPIES],
                CAST(
                    CASE WHEN SUM_TOTAL = 0 THEN 0 ELSE ( [SPECIALTY] / SUM_TOTAL * 100 ) END AS DECIMAL(10,2)
                ) AS [SPECIALTY],
                CAST(
                    CASE WHEN SUM_TOTAL = 0 THEN 0 ELSE ( [TOFC CHOCOLATE] / SUM_TOTAL * 100 ) END AS DECIMAL(10,2)
                ) AS [TOFC CHOCOLATE],
                CAST(
                    CASE WHEN SUM_TOTAL = 0 THEN 0 ELSE ( [UNKNOWN] / SUM_TOTAL * 100 ) END AS DECIMAL(10,2)
                ) AS [UNKNOWN]
            FROM (
                SELECT 
                    s.Distributor,
                    SUM([BAKING]) AS [BAKING],
                    SUM([BARLINE]) AS [BARLINE],
                    SUM([CHOCOLATE]) AS [CHOCOLATE],
                    SUM([GUMMY]) AS [GUMMY],
                    SUM([MARSHMALLOW]) AS [MARSHMALLOW],
                    SUM([PANNING]) AS [PANNING],
                    SUM([PROMO]) AS [PROMO],
                    SUM([RICE CRISPIES]) AS [RICE CRISPIES],
                    SUM([SPECIALTY]) AS [SPECIALTY],
                    SUM([TOFC CHOCOLATE]) AS [TOFC CHOCOLATE],
                    SUM([UNKNOWN]) AS [UNKNOWN],
                    SUM(
                        [BAKING]+[BARLINE]+[CHOCOLATE]+[GUMMY]+[MARSHMALLOW]+
                        [PANNING]+[PROMO]+[RICE CRISPIES]+[SPECIALTY]+
                        [TOFC CHOCOLATE]+[UNKNOWN]
                    ) AS SUM_TOTAL
                FROM Pivoted s
                GROUP BY s.Distributor
            ) AS Tot
        )
        SELECT 
            'VOLUME IN AMOUNT' AS Particular,
            Distributor,
            ChannelType,
            [BAKING],[BARLINE],[CHOCOLATE],[GUMMY],[MARSHMALLOW],
            [PANNING],[PROMO],[RICE CRISPIES],[SPECIALTY],
            [TOFC CHOCOLATE],[UNKNOWN],
            ([BAKING]+[BARLINE]+[CHOCOLATE]+[GUMMY]+[MARSHMALLOW]+
             [PANNING]+[PROMO]+[RICE CRISPIES]+[SPECIALTY]+
             [TOFC CHOCOLATE]+[UNKNOWN]) AS [TOTAL]
        FROM (
            SELECT * FROM WithPercentages
            UNION ALL
            SELECT * FROM WithSubtotals
            UNION ALL
            SELECT * FROM Pivoted
        ) AS Combined
        ORDER BY Distributor,
                 CASE 
                     WHEN ChannelType = 'AAA_% SHARE' THEN 0
                     WHEN ChannelType = 'ZZZ_SUBTOTAL' THEN 1
                     ELSE 2 
                 END,
                 ChannelType;
	END

COMMIT TRANSACTION 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO
