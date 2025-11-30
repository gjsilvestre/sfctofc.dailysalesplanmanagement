using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SFCTOFC.DailySalesPlanManagement.Application.DSPMOutletTasks.Caching;
using SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.DTOs;

namespace SFCTOFC.DailySalesPlanManagement.Application.Features.DSPMSalesmanDailyPlan.Caching;

public static class SalesmanDailyPlanCacheKey
{
    public const string GetAllCacheKey = "all-SalesmanDailyPlan";

    public static string GetSalesmanDailyPlanByIdCacheKey(int id)
    {
        return $"GetSalesmanDailyPlanById,{id}";
    }

    public static string GetPaginationCacheKey(string parameters)
    {
        return $"SalesmanDailyPlanWithPaginationQuery,{parameters}";
    }
    public static IEnumerable<string>? Tags => new string[] { "SalesmanDailyPlan" };
    public static void Refresh()
    {
        FusionCacheFactory.RemoveByTags(Tags);
    }
}