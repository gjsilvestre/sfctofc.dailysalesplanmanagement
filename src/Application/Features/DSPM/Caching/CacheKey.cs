
namespace SFCTOFC.DailySalesPlanManagementApplication.Features.DSPM.Caching;
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
