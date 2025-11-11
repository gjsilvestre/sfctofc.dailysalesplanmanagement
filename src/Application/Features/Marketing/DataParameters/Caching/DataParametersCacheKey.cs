

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Marketing.MRKDataParameters.Caching;

public class MRKDataParametersCacheKey
{
    public const string GetAllCacheKey = "all-MRKDataParameters";
    public static string GetMRKDataParametersByIdKey(Guid refId)
    {
        return $"GetStreamByIdKey:{refId}";
    }
    public static string GetPaginationCacheKey(string parameters)
    {
        return $"MRKDataParametersWithPaginationQuery,{parameters}";
    }
    public static IEnumerable<string>? Tags => new string[] { "MRKDataParameters" };
    public static void Refresh()
    {
        FusionCacheFactory.RemoveByTags(Tags);
    }
}

public class DashboardFilterCacheKey
{
    public const string GetAllCacheKey = "all-MRKDataParametersCacheKey";
    public static string GetDashboardFilterCacheKeyByIdKey(int Id)
    {
        return $"GetStreamByIdKey:{Id}";
    }
    public static string GetPaginationCacheKey(string parameters)
    {
        return $"MRKDataParametersWithPaginationQuery,{parameters}";
    }
    public static IEnumerable<string>? Tags => new string[] { "MRKDataParameters" };
    public static void Refresh()
    {
        FusionCacheFactory.RemoveByTags(Tags);
    }
}
