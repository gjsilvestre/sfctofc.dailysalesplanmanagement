
/********************************************************************************************************/ 
/****************************************  STORED PROCEDURE *********************************************/ 
/********************************************************************************************************/ 

/*****************************************************************************************************
   Procedure Name      : [SP_GetSalesForecastSummary]
   Created By          : Gilbert Silvestre
   Created Date        : 10/07/2025
   Last Modified By    : 
   Last Modified Date  : 
   Synopsis            : 
*****************************************************************************************************/
IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SP_GetSalesForecastSummary]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[SP_GetSalesForecastSummary]
GO


--exec SP_GetSalesForecastSummary '6/1/2025', '6/30/2025', 'RODZON', 'ALL REGION'
CREATE PROCEDURE SP_GetSalesForecastSummary
    @start_date DATE,
    @end_date DATE,
    @distributor NVARCHAR(100),
    @region NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Normalize filters (trim + uppercase)
    SET @distributor = UPPER(LTRIM(RTRIM(@distributor)));
    SET @region = UPPER(LTRIM(RTRIM(@region)));

    -- Split the input strings into table variables
    DECLARE @DistributorList TABLE (Distributor NVARCHAR(100));
    DECLARE @RegionList TABLE (Region NVARCHAR(100));

    INSERT INTO @DistributorList
    SELECT LTRIM(RTRIM(value))
    FROM STRING_SPLIT(@distributor, ',');

    INSERT INTO @RegionList
    SELECT LTRIM(RTRIM(value))
    FROM STRING_SPLIT(@region, ',');

    SELECT 
        -- Raw target
        SUM(DSF.ForecastAmount) AS Target,

        -- Formatted ActualSTT
        CASE
            WHEN SUM(DSC.TotalSales) >= 1000000 
                THEN CONCAT(FORMAT(SUM(DSC.TotalSales) / 1000000.0, 'N2'), 'M')
            WHEN SUM(DSC.TotalSales) >= 1000 
                THEN CONCAT(FORMAT(SUM(DSC.TotalSales) / 1000.0, 'N2'), 'K')
            ELSE FORMAT(SUM(DSC.TotalSales), 'N2')
        END AS ActualSTT,

        -- Attainment
        CAST(SUM(DSC.TotalSales) / NULLIF(SUM(DSF.ForecastAmount), 0) AS DECIMAL(18,6)) AS Attainment,

        -- Previous Year Sales
        SUM(DSP.TotalSales) AS PreviousSales,

        -- Two Years Ago Sales
        SUM(DSP2.TotalSales) AS Previous2Sales,

        -- Inc/Dec from Previous Year to Current
        CASE 
            WHEN SUM(DSP.TotalSales) = 0 THEN NULL
            ELSE (SUM(DSC.TotalSales) - SUM(DSP.TotalSales)) / SUM(DSP.TotalSales)
        END AS IncDec,

        -- Inc/Dec from Two Years Ago to Previous Year
        CASE 
            WHEN SUM(DSP2.TotalSales) = 0 THEN NULL
            ELSE (SUM(DSP.TotalSales) - SUM(DSP2.TotalSales)) / SUM(DSP2.TotalSales)
        END AS IncDecPrevious

    FROM DistributorSalesForecast DSF

    -- Current Year Sales
    INNER JOIN (
        SELECT
            S.Distributor,
            SUM(S.NetPrice) AS TotalSales
        FROM DistributorSales S
        WHERE
            S.InvoiceDate BETWEEN @start_date AND @end_date
            AND S.NetPrice > 0
            AND (
                @distributor = 'ALL DISTRIBUTOR'
                OR UPPER(S.Distributor) IN (SELECT Distributor FROM @DistributorList)
            )
            AND (
                @region = 'ALL REGION'
                OR S.OutletCode IN (
                    SELECT OutletCode 
                    FROM distributoroutlet 
                    WHERE UPPER(Region) IN (SELECT Region FROM @RegionList)
                )
            )
        GROUP BY S.Distributor
    ) DSC ON DSF.Distributor = DSC.Distributor

    -- Previous Year Sales
    INNER JOIN (
        SELECT
            S.Distributor,
            SUM(S.NetPrice) AS TotalSales
        FROM DistributorSales S
        WHERE
            S.InvoiceDate BETWEEN DATEADD(YEAR, -1, @start_date) 
                              AND DATEADD(YEAR, -1, @end_date)
            AND S.NetPrice > 0
            AND (
                @distributor = 'ALL DISTRIBUTOR'
                OR UPPER(S.Distributor) IN (SELECT Distributor FROM @DistributorList)
            )
            AND (
                @region = 'ALL REGION'
                OR S.OutletCode IN (
                    SELECT OutletCode 
                    FROM distributoroutlet 
                    WHERE UPPER(Region) IN (SELECT Region FROM @RegionList)
                )
            )
        GROUP BY S.Distributor
    ) DSP ON DSF.Distributor = DSP.Distributor

    -- Two Years Ago Sales
    LEFT JOIN (
        SELECT
            S.Distributor,
            SUM(S.NetPrice) AS TotalSales
        FROM DistributorSales S
        WHERE
            S.InvoiceDate BETWEEN DATEADD(YEAR, -2, @start_date) 
                              AND DATEADD(YEAR, -2, @end_date)
            AND S.NetPrice > 0
            AND (
                @distributor = 'ALL DISTRIBUTOR'
                OR UPPER(S.Distributor) IN (SELECT Distributor FROM @DistributorList)
            )
            AND (
                @region = 'ALL REGION'
                OR S.OutletCode IN (
                    SELECT OutletCode 
                    FROM distributoroutlet 
                    WHERE UPPER(Region) IN (SELECT Region FROM @RegionList)
                )
            )
        GROUP BY S.Distributor
    ) DSP2 ON DSF.Distributor = DSP2.Distributor

    WHERE 
        DSF.Date BETWEEN @start_date AND @end_date;
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


/*****************************************************************************************************
   Procedure Name      : [SP_GetDistributorSalesSummary]
   Created By          : Gilbert Silvestre
   Created Date        : 10/06/2025
   Last Modified By    : 
   Last Modified Date  : 
   Synopsis            : 
*****************************************************************************************************/

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SP_GetDistributorSalesSummary]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[SP_GetDistributorSalesSummary]
GO

--exec SP_GetDistributorSalesSummary '6/1/2025', '6/30/2025', 'RODZON', 'ALL REGION'
CREATE PROCEDURE SP_GetDistributorSalesSummary
    @start_date DATE,
    @end_date DATE,
    @distributor NVARCHAR(MAX),
    @region NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    -- Normalize filters (trim + uppercase)
    SET @distributor = UPPER(LTRIM(RTRIM(@distributor)));
    SET @region = UPPER(LTRIM(RTRIM(@region)));

    -- Split the input strings into table variables
    DECLARE @DistributorList TABLE (Distributor NVARCHAR(100));
    DECLARE @RegionList TABLE (Region NVARCHAR(100));

    INSERT INTO @DistributorList
    SELECT LTRIM(RTRIM(value))
    FROM STRING_SPLIT(@distributor, ',');

    INSERT INTO @RegionList
    SELECT LTRIM(RTRIM(value))
    FROM STRING_SPLIT(@region, ',');

    SELECT
        SUM(ISNULL(DSF.ForecastAmount, 0)) AS Target,

        CASE
            WHEN SUM(DSC.TotalSales) >= 1000000 THEN CONCAT(FORMAT(SUM(DSC.TotalSales) / 1000000, 'N2'), 'M')
            WHEN SUM(DSC.TotalSales) >= 1000 THEN CONCAT(FORMAT(SUM(DSC.TotalSales) / 1000, 'N2'), 'K')
            ELSE FORMAT(SUM(DSC.TotalSales), 'N2')
        END AS ActualSTT,

        CASE 
            WHEN SUM(ISNULL(DSF.ForecastAmount, 0)) = 0 THEN NULL
            ELSE SUM(DSC.TotalSales) / SUM(ISNULL(DSF.ForecastAmount, 0))
        END AS Attainment,

        SUM(ISNULL(DSP.TotalSales, 0)) AS PreviousSales,
        SUM(ISNULL(DSP2.TotalSales, 0)) AS Previous2Sales,

        CASE 
            WHEN SUM(ISNULL(DSP.TotalSales, 0)) = 0 THEN NULL
            ELSE (SUM(DSC.TotalSales) - SUM(DSP.TotalSales)) / SUM(DSP.TotalSales)
        END AS IncDec,

        CASE 
            WHEN SUM(ISNULL(DSP2.TotalSales, 0)) = 0 THEN NULL
            ELSE (SUM(DSP.TotalSales) - SUM(DSP2.TotalSales)) / SUM(DSP2.TotalSales)
        END AS IncDecPrevious

    FROM (
        SELECT
            S.Distributor,
            SUM(S.NetPrice) AS TotalSales
        FROM distributorsales S
        WHERE
            S.InvoiceDate BETWEEN @start_date AND @end_date
            AND S.NetPrice > 0
            AND (
                @distributor = 'ALL DISTRIBUTOR'
                OR UPPER(S.Distributor) IN (SELECT Distributor FROM @DistributorList)
            )
            AND (
                @region = 'ALL REGION'
                OR S.OutletCode IN (
                    SELECT OutletCode 
                    FROM distributoroutlet 
                    WHERE UPPER(Region) IN (SELECT Region FROM @RegionList)
                )
            )
        GROUP BY S.Distributor
    ) DSC
    LEFT JOIN DistributorSalesForecast DSF
        ON DSF.Distributor = DSC.Distributor
        AND DSF.[Date] BETWEEN @start_date AND @end_date
    LEFT JOIN (
        SELECT Distributor, SUM(NetPrice) AS TotalSales
        FROM distributorsales
        WHERE InvoiceDate BETWEEN DATEADD(YEAR, -1, @start_date) AND DATEADD(YEAR, -1, @end_date)
        GROUP BY Distributor
    ) DSP ON DSC.Distributor = DSP.Distributor
    LEFT JOIN (
        SELECT Distributor, SUM(NetPrice) AS TotalSales
        FROM distributorsales
        WHERE InvoiceDate BETWEEN DATEADD(YEAR, -2, @start_date) AND DATEADD(YEAR, -2, @end_date)
        GROUP BY Distributor
    ) DSP2 ON DSC.Distributor = DSP2.Distributor;
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


/*****************************************************************************************************
   Procedure Name      : [SP_GetTotalSalesGrowth]
   Created By          : Gilbert Silvestre
   Created Date        : 10/07/2025
   Last Modified By    : 
   Last Modified Date  : 
   Synopsis            : 
*****************************************************************************************************/
IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SP_GetTotalSalesGrowth]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[SP_GetTotalSalesGrowth];
GO

--EXEC SP_GetTotalSalesGrowth @start_date = '2025-06-01',  @end_date = '2025-06-30', @distributor = 'RODZON',  @region = 'ALL REGION';
CREATE PROCEDURE SP_GetTotalSalesGrowth
    @start_date DATE,
    @end_date DATE,
    @distributor NVARCHAR(100),
    @region NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Normalize filters (trim + uppercase)
    SET @distributor = UPPER(LTRIM(RTRIM(@distributor)));
    SET @region = UPPER(LTRIM(RTRIM(@region)));

    -- Split the input strings into table variables
    DECLARE @DistributorList TABLE (Distributor NVARCHAR(100));
    DECLARE @RegionList TABLE (Region NVARCHAR(100));

    INSERT INTO @DistributorList
    SELECT LTRIM(RTRIM(value))
    FROM STRING_SPLIT(@distributor, ',');

    INSERT INTO @RegionList
    SELECT LTRIM(RTRIM(value))
    FROM STRING_SPLIT(@region, ',');

    SELECT 
        ROUND(
            (
                (SUM(ISNULL(CSL.SalesAmount, 0)) - SUM(ISNULL(PSL.SalesAmount, 0))) /
                NULLIF(SUM(ISNULL(PSL.SalesAmount, 0)), 0)
            ),
            6
        ) AS TotalSalesGrowth
    FROM
    (
        SELECT
            DS.Distributor,
            DO.Region,
            SUM(DS.NetPrice) AS SalesAmount
        FROM DistributorSales DS
        INNER JOIN DistributorOutlet DO 
            ON DS.OutletCode = DO.OutletCode
            AND DS.Distributor = DO.Distributor
        WHERE
            DS.InvoiceDate BETWEEN @start_date AND @end_date
            AND (
                @distributor = 'ALL DISTRIBUTOR'
                OR UPPER(DS.Distributor) IN (SELECT Distributor FROM @DistributorList)
            )
            AND (
                @region = 'ALL REGION'
                OR DS.OutletCode IN (
                    SELECT OutletCode 
                    FROM DistributorOutlet 
                    WHERE UPPER(Region) IN (SELECT Region FROM @RegionList)
                )
            )
        GROUP BY DS.Distributor, DO.Region
    ) AS CSL
    INNER JOIN
    (
        SELECT
            DS.Distributor,
            DO.Region,
            SUM(DS.NetPrice) AS SalesAmount
        FROM DistributorSales DS
        INNER JOIN DistributorOutlet DO 
            ON DS.OutletCode = DO.OutletCode
            AND DS.Distributor = DO.Distributor
        WHERE
            DS.InvoiceDate BETWEEN DATEADD(YEAR, -1, @start_date) AND DATEADD(YEAR, -1, @end_date)
            AND (
                @distributor = 'ALL DISTRIBUTOR'
                OR UPPER(DS.Distributor) IN (SELECT Distributor FROM @DistributorList)
            )
            AND (
                @region = 'ALL REGION'
                OR DS.OutletCode IN (
                    SELECT OutletCode 
                    FROM DistributorOutlet 
                    WHERE UPPER(Region) IN (SELECT Region FROM @RegionList)
                )
            )
        GROUP BY DS.Distributor, DO.Region
    ) AS PSL
        ON CSL.Distributor = PSL.Distributor
        AND CSL.Region = PSL.Region;
END
GO

SET QUOTED_IDENTIFIER OFF;
GO
SET ANSI_NULLS ON;
GO


/*****************************************************************************************************
   Procedure Name      : [SP_GetMarketPenetration]
   Created By          : Gilbert Silvestre
   Created Date        : 10/07/2025
   Last Modified By    : 
   Last Modified Date  : 
   Synopsis            : 
*****************************************************************************************************/
IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SP_GetMarketPenetration]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[SP_GetMarketPenetration];
GO

--EXEC SP_GetTotalMarketPenetration @start_date = '2025-06-01',  @end_date = '2025-06-30', @distributor = 'RODZON',  @region = 'ALL REGION';
CREATE PROCEDURE [dbo].[SP_GetMarketPenetration]
    @start_date DATE,
    @end_date DATE,
    @distributor NVARCHAR(100),
    @region NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Normalize filters
    SET @distributor = UPPER(LTRIM(RTRIM(@distributor)));
    SET @region = UPPER(LTRIM(RTRIM(@region)));

    DECLARE @DistributorList TABLE (Distributor NVARCHAR(100));
    DECLARE @RegionList TABLE (Region NVARCHAR(100));

    INSERT INTO @DistributorList SELECT LTRIM(RTRIM(value)) FROM STRING_SPLIT(@distributor, ',');
    INSERT INTO @RegionList SELECT LTRIM(RTRIM(value)) FROM STRING_SPLIT(@region, ',');

    ---------------------------------------------------------
    -- CTEs for active and buying outlets
    ---------------------------------------------------------
    ;WITH ActiveOutlet_Current AS (
        SELECT 
            O.Distributor, 
            O.Province, 
            O.Region, 
            COUNT(DISTINCT S.OutletCode) AS Total
        FROM DistributorSales S
        LEFT JOIN DistributorOutlet O ON O.OutletCode = S.OutletCode AND O.Distributor = S.Distributor
        LEFT JOIN DistributorItemMapping M ON M.ItemCode = S.ItemCode AND M.Distributor = S.Distributor
        WHERE 
            S.InvoiceDate BETWEEN DATEADD(MONTH, -2, @start_date) AND @end_date
            AND S.Distributor IS NOT NULL 
            AND S.NetPrice > 0
        GROUP BY O.Distributor, O.Province, O.Region
    ),
    ActiveOutlet_Previous AS (
        SELECT 
            O.Distributor, 
            O.Province, 
            O.Region, 
            COUNT(DISTINCT S.OutletCode) AS Total
        FROM DistributorSales S
        LEFT JOIN DistributorOutlet O ON O.OutletCode = S.OutletCode AND O.Distributor = S.Distributor
        LEFT JOIN DistributorItemMapping M ON M.ItemCode = S.ItemCode AND M.Distributor = S.Distributor
        WHERE 
            S.InvoiceDate BETWEEN DATEADD(YEAR, -1, DATEADD(MONTH, -2, @start_date)) 
                               AND DATEADD(YEAR, -1, @end_date)
            AND S.Distributor IS NOT NULL 
            AND S.NetPrice > 0
        GROUP BY O.Distributor, O.Province, O.Region
    ),
    BuyingOutlet_Current AS (
        SELECT 
            O.Distributor, 
            O.Province, 
            O.Region, 
            COUNT(DISTINCT S.OutletCode) AS Total
        FROM DistributorSales S
        LEFT JOIN DistributorOutlet O ON O.OutletCode = S.OutletCode AND O.Distributor = S.Distributor
        LEFT JOIN DistributorItemMapping M ON M.ItemCode = S.ItemCode AND M.Distributor = S.Distributor
        WHERE 
            S.InvoiceDate BETWEEN @start_date AND @end_date
            AND S.Distributor IS NOT NULL 
            AND S.NetPrice > 0
        GROUP BY O.Distributor, O.Province, O.Region
    ),
    BuyingOutlet_Previous AS (
        SELECT 
            O.Distributor, 
            O.Province, 
            O.Region, 
            COUNT(DISTINCT S.OutletCode) AS Total
        FROM DistributorSales S
        LEFT JOIN DistributorOutlet O ON O.OutletCode = S.OutletCode AND O.Distributor = S.Distributor
        LEFT JOIN DistributorItemMapping M ON M.ItemCode = S.ItemCode AND M.Distributor = S.Distributor
        WHERE 
            S.InvoiceDate BETWEEN DATEADD(YEAR, -1, @start_date) 
                               AND DATEADD(YEAR, -1, @end_date)
            AND S.Distributor IS NOT NULL 
            AND S.NetPrice > 0
        GROUP BY O.Distributor, O.Province, O.Region
    )

    ---------------------------------------------------------
    -- Main per distributor/region
    ---------------------------------------------------------
    SELECT
        DP.Distributor,
        DP.Region,
        SUM(DP.PopulationCount) AS Population,
        SUM(DP.UrbanPopulationCount) AS UrbanPopulation,
        SUM(DP.ApproxNoOutlet) AS ApproxNoOutlet,
        ROUND(SUM(DP.ApproxNoOutlet) * 0.03, 0) AS TargetNoOutlet,
        SUM(AOC.Total) AS ActiveOutlet_Current,
        SUM(AOP.Total) AS ActiveOutlet_Previous,
        SUM(BOC.Total) AS BuyingOutlet_Current,
        SUM(BOP.Total) AS BuyingOutlet_Previous,
        CAST(SUM(AOC.Total) AS DECIMAL(18,6)) / NULLIF(ROUND(SUM(DP.ApproxNoOutlet) * 0.03, 0), 0) AS PenetrationRate,
        CAST(SUM(BOC.Total) AS DECIMAL(18,6)) / NULLIF(ROUND(SUM(DP.ApproxNoOutlet) * 0.03, 0), 0) AS BuyingOutletRate
    FROM DistributorOutletPopulationGrowth DP
    LEFT JOIN ActiveOutlet_Current AOC 
        ON AOC.Province = DP.Province AND AOC.Distributor = DP.Distributor AND AOC.Region = DP.Region
    LEFT JOIN ActiveOutlet_Previous AOP 
        ON AOP.Province = DP.Province AND AOP.Distributor = DP.Distributor AND AOP.Region = DP.Region
    LEFT JOIN BuyingOutlet_Current BOC 
        ON BOC.Province = DP.Province AND BOC.Distributor = DP.Distributor AND BOC.Region = DP.Region
    LEFT JOIN BuyingOutlet_Previous BOP 
        ON BOP.Province = DP.Province AND BOP.Distributor = DP.Distributor AND BOP.Region = DP.Region
    WHERE 
        (@distributor = 'ALL DISTRIBUTOR' OR UPPER(DP.Distributor) IN (SELECT Distributor FROM @DistributorList))
        AND (@region = 'ALL REGION' OR DP.Region IN (SELECT Region FROM @RegionList))
    GROUP BY DP.Distributor, DP.Region

    ---------------------------------------------------------
    -- Total Row
    ---------------------------------------------------------
    UNION ALL

    SELECT
        'TOTAL' AS Distributor,
        '' AS Region,
        SUM(DP.PopulationCount),
        SUM(DP.UrbanPopulationCount),
        SUM(DP.ApproxNoOutlet),
        ROUND(SUM(DP.ApproxNoOutlet) * 0.03, 0),
        SUM(AOC.Total),
        SUM(AOP.Total),
        SUM(BOC.Total),
        SUM(BOP.Total),
        CAST(SUM(AOC.Total) AS DECIMAL(18,6)) / NULLIF(ROUND(SUM(DP.ApproxNoOutlet) * 0.03, 0), 0),
        CAST(SUM(BOC.Total) AS DECIMAL(18,6)) / NULLIF(ROUND(SUM(DP.ApproxNoOutlet) * 0.03, 0), 0)
    FROM DistributorOutletPopulationGrowth DP
    LEFT JOIN ActiveOutlet_Current AOC 
        ON AOC.Province = DP.Province AND AOC.Distributor = DP.Distributor AND AOC.Region = DP.Region
    LEFT JOIN ActiveOutlet_Previous AOP 
        ON AOP.Province = DP.Province AND AOP.Distributor = DP.Distributor AND AOP.Region = DP.Region
    LEFT JOIN BuyingOutlet_Current BOC 
        ON BOC.Province = DP.Province AND BOC.Distributor = DP.Distributor AND BOC.Region = DP.Region
    LEFT JOIN BuyingOutlet_Previous BOP 
        ON BOP.Province = DP.Province AND BOP.Distributor = DP.Distributor AND BOP.Region = DP.Region
    WHERE 
        (@distributor = 'ALL DISTRIBUTOR' OR UPPER(DP.Distributor) IN (SELECT Distributor FROM @DistributorList))
        AND (@region = 'ALL REGION' OR DP.Region IN (SELECT Region FROM @RegionList));

END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


/*****************************************************************************************************
   Procedure Name      : [SP_SalesToTradeDashboard]
   Created By          : Gilbert Silvestre
   Created Date        : 10/06/2025
   Last Modified By    : 
   Last Modified Date  : 
   Synopsis            : 
*****************************************************************************************************/
IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SP_SalesToTradeDashboard]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[SP_SalesToTradeDashboard]
GO

CREATE PROCEDURE SP_SalesToTradeDashboard
    @mode NVARCHAR(100)
AS
BEGIN

    SET NOCOUNT ON;

    IF (UPPER(@mode) = 'DISTRIBUTOR')
    BEGIN
        SELECT DISTINCT Distributor 
        FROM DistributorOutlet 
        WHERE Distributor NOT IN ('3AMC', 'CHUA', 'FASTTRAX', 
                                  'GRANVILLE', 'PDE', 'RBM', 
                                  'SOUTHCORE', 'STAPLE')
        ORDER BY Distributor
    END

    IF (UPPER(@mode) = 'REGION')
    BEGIN
        SELECT DISTINCT Region FROM DistributorOutlet ORDER BY Region
    END

END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

