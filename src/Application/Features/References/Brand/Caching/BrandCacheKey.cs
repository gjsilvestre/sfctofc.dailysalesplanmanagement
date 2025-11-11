using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.References.REFBrand.Caching;
public class BrandCacheKey
{
    public const string GetAllCacheKey = "all-Brand";
    public static string GetBrandByIdCacheKey(int id)
    {
        return $"GetBrandWyId,{id}";
    }
    public static string GetPaginationCacheKey(string parameters)
    {
        return $"BrandWithPaginationQuery,{parameters}";
    }
    public static IEnumerable<string>? Tags => new string[] { "brand" };
    public static void Refresh()
    {
        FusionCacheFactory.RemoveByTags(Tags);
    }
}