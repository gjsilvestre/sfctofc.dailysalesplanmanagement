using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Marketing.MRKSalesToTrade.Caching;
public class SalesToTradeKPICacheKey
{
    public const string GetAllCacheKey = "all-SalesToTradeKPI";
    public static string GetSalesToTradeKPIByIdKey(Guid refId)
    {
        return $"GetStreamByIdKey:{refId}";
    }
    public static string GetPaginationCacheKey(string parameters)
    {
        return $"SalesToTradeKPIWithPaginationQuery,{parameters}";
    }
    public static IEnumerable<string>? Tags => new string[] { "SalesToTradeKPI" };
    public static void Refresh()
    {
        FusionCacheFactory.RemoveByTags(Tags);
    }
}

