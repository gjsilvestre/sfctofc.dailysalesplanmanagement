
#nullable enable
#nullable disable warnings

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.Caching;
/// <summary>
/// Static class for managing cache keys and expiration for Contact-related data.
/// </summary>
public static class ContactCacheKey
{
    public const string GetAllCacheKey = "all-Contacts";
    public static string GetPaginationCacheKey(string parameters) {
        return $"ContactCacheKey:ContactsWithPaginationQuery,{parameters}";
    }
    public static string GetExportCacheKey(string parameters) {
        return $"ContactCacheKey:ExportCacheKey,{parameters}";
    }
    public static string GetByNameCacheKey(string parameters) {
        return $"ContactCacheKey:GetByNameCacheKey,{parameters}";
    }
    public static string GetByIdCacheKey(string parameters) {
        return $"ContactCacheKey:GetByIdCacheKey,{parameters}";
    }
    public static IEnumerable<string>? Tags => new string[] { "contact" };
    public static void Refresh()
    {
        FusionCacheFactory.RemoveByTags(Tags);
    }
}

