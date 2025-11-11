using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.References.REFBrand.Specifications;
public class BrandAdvancedSpecification : Specification<Brands>
{
    public BrandAdvancedSpecification(BrandAdvancedFilter filter)
    {
        DateTime today = DateTime.UtcNow;
        var todayrange = today.GetDateRange("TODAY", filter.CurrentUser.LocalTimeOffset);
        var last30daysrange = today.GetDateRange("LAST_30_DAYS", filter.CurrentUser.LocalTimeOffset);
        //Query.Where(x => x.Title != null)
        //    .Where(x => x.Title.Contains(filter.Keyword) || x.Title.Contains(filter.Keyword))

        //    .Where(x => x.Title.Contains(filter.Title), !string.IsNullOrEmpty(filter.Title))
        //    .Where(x => x.Description == filter.Description, !string.IsNullOrEmpty(filter.Description))
        //    .Where(x => x.Category == filter.Category, !string.IsNullOrEmpty(filter.Category))

        //    .Where(x => x.CreatedBy == filter.CurrentUser.UserId, filter.ListView == WOListView.My)
        //    .Where(x => x.Created >= todayrange.Start && x.Created < todayrange.End.AddDays(1), filter.ListView == WOListView.TODAY)
        //    .Where(x => x.Created >= last30daysrange.Start, filter.ListView == WOListView.LAST_30_DAYS);

    }
}
