
namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Distributors.Caching;

public static class DistributorCacheKey
{
    public const string GetAllCacheKey = "all-distributors";
    public static string GetStreamByIdKey(int id)
    {
        return $"GetStreamByIdKey:{id}";
    }
    public static string GetPaginationCacheKey(string parameters)
    {
        return $"DistributorsWithPaginationQuery,{parameters}";
    }
    public static IEnumerable<string>? Tags => new string[] { "distributor" };
    public static void Refresh()
    {
        FusionCacheFactory.RemoveByTags(Tags);
    }
}
