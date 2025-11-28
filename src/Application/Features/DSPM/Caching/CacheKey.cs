
namespace SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.Caching;

#region OUTLETS

public static class OutletsCacheKey
{
    public const string GetAllCacheKey = "all-Outlets";
    public static string GetOutletByIdCacheKey(int id)
    {
        return $"GetOutletById,{id}";
    }
    public static string GetPaginationCacheKey(string parameters)
    {
        return $"OutletsWithPaginationQuery,{parameters}";
    }
    public static IEnumerable<string>? Tags => new string[] { "outlet" };
    public static void Refresh()
    {
        FusionCacheFactory.RemoveByTags(Tags);
    }
}

#endregion

#region SALESMANTRACKER

public static class SalesmanTracketCacheKey
{
    public const string GetAllCacheKey = "all-SalesmanTracker";

    public static string GetSalesmanTrackerByIdCacheKey(int id)
    {
        return $"GetSalesmanTrackerById,{id}";
    }
    public static string GetPaginationCacheKey(string parameters)
    {
        return $"SalesmanTrackerWithPaginationQuery,{parameters}";
    }
    public static IEnumerable<string>? Tags => new string[] { "SalesmanTracker" };
    public static void Refresh()
    {
        FusionCacheFactory.RemoveByTags(Tags);
    }
}

#endregion

#region PURCHASE ORDER

public static class PurchaseOrderCacheKey
{
    public const string GetAllCacheKey = "all-PurchaseOrder";

    public static string GetPurchaseOrderByIdCacheKey(int id)
    {
        return $"GetPurchaseOrderById,{id}";
    }

    public static string GetPaginationCacheKey(string parameters)
    {
        return $"PurchaseOrderWithPaginationQuery,{parameters}";
    }
    public static IEnumerable<string>? Tags => new string[] { "PurchaseOrder" };
    public static void Refresh()
    {
        FusionCacheFactory.RemoveByTags(Tags);
    }
}

public static class PurchaseOrderDetailsCacheKey
{
    public const string GetAllCacheKey = "all-PurchaseOrderDetails";

    public static string GetPurchaseOrderDetailsByIdCacheKey(int id)
    {
        return $"GetPurchaseOrderDetailsById,{id}";
    }

    public static string GetPaginationCacheKey(string parameters)
    {
        return $"PurchaseOrderDetailsWithPaginationQuery,{parameters}";
    }
    public static IEnumerable<string>? Tags => new string[] { "PurchaseOrderDetails" };
    public static void Refresh()
    {
        FusionCacheFactory.RemoveByTags(Tags);
    }
}

#endregion

#region SALES ORDER

public static class SalesOrderCacheKey
{
    public const string GetAllCacheKey = "all-SalesOrder";

    public static string GetSalesOrderByIdCacheKey(int id)
    {
        return $"GetSalesOrderById,{id}";
    }

    public static string GetPaginationCacheKey(string parameters)
    {
        return $"SalesOrderWithPaginationQuery,{parameters}";
    }
    public static IEnumerable<string>? Tags => new string[] { "SalesOrder" };
    public static void Refresh()
    {
        FusionCacheFactory.RemoveByTags(Tags);
    }
}

#endregion