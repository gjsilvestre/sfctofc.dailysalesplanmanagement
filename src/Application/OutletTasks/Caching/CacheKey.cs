using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFCTOFC.DailySalesPlanManagement.Application.DSPMOutletTasks.Caching;
public static class OutletTasksCacheKey
{
    public const string GetAllCacheKey = "all-OutletTasks";

    public static string GetOutletTasksByIdCacheKey(int id)
    {
        return $"GetOutletTasksById,{id}";
    }

    public static string GetPaginationCacheKey(string parameters)
    {
        return $"OutletTasksWithPaginationQuery,{parameters}";
    }
    public static IEnumerable<string>? Tags => new string[] { "OutletTasks" };
    public static void Refresh()
    {
        FusionCacheFactory.RemoveByTags(Tags);
    }
}

