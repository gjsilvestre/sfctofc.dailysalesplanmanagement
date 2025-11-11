
namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Products.Caching;

public static class ProductCacheKey
{
    public const string GetAllCacheKey = "all-Products";
    public static string GetProductByIdCacheKey(int id)
    {
        return $"GetProductById,{id}";
    }
    public static string GetPaginationCacheKey(string parameters)
    {
        return $"ProductsWithPaginationQuery,{parameters}";
    }
    public static IEnumerable<string>? Tags => new string[] { "product" };
    public static void Refresh()
    {
        FusionCacheFactory.RemoveByTags(Tags);
    }

}
