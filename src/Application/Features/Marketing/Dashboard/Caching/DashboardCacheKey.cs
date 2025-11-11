using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Marketing.MRKDashboard.Caching;
public class DashboardTotalSalesForecastAccuracyCacheKey
{
    public const string GetAllCacheKey = "all-DashboardTotalSalesForecastAccuracy";
    public static string GetDashboardTotalSalesForecastAccuracyByIdKey(Guid refId)
    {
        return $"GetStreamByIdKey:{refId}";
    }
    public static string GetPaginationCacheKey(string parameters)
    {
        return $"ProductionTicketWithPaginationQuery,{parameters}";
    }
    public static IEnumerable<string>? Tags => new string[] { "DashboardTotalSalesForecastAccuracy" };
    public static void Refresh()
    {
        FusionCacheFactory.RemoveByTags(Tags);
    }
}

public class DashboardFilterCacheKey
{
    public const string GetAllCacheKey = "all-DashboardFilterCacheKey";
    public static string GetDashboardFilterCacheKeyByIdKey(int Id)
    {
        return $"GetStreamByIdKey:{Id}";
    }
    public static string GetPaginationCacheKey(string parameters)
    {
        return $"DashboardFilterWithPaginationQuery,{parameters}";
    }
    public static IEnumerable<string>? Tags => new string[] { "DashboardFilter" };
    public static void Refresh()
    {
        FusionCacheFactory.RemoveByTags(Tags);
    }
}
