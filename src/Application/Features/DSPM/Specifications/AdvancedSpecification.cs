
namespace SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.Specifications;

public class AdvancedSpecificationSalesmanTracker : Specification<SalesmanTracker>
{
    public AdvancedSpecificationSalesmanTracker(AdvancedFilterSalesmanTracker filter)
    {
        DateTime today = DateTime.UtcNow;
        var todayrange = today.GetDateRange("TODAY", filter.CurrentUser.LocalTimeOffset);
        var last30daysrange = today.GetDateRange("LAST_30_DAYS", filter.CurrentUser.LocalTimeOffset);
        Query.Where(x => x.AspNetUserId != null)
             .Where(x =>x.Name.Contains(filter.Keyword), !string.IsNullOrEmpty(filter.Keyword))
             .Where(x => x.Date >= filter.Date && x.Date <= filter.Date)

             .Where(x => x.CreatedBy == filter.CurrentUser.UserId, filter.ListView == ListView.My)
             .Where(x => x.Created >= todayrange.Start && x.Created < todayrange.End.AddDays(1), filter.ListView == ListView.TODAY)
             .Where(x => x.Created >= last30daysrange.Start, filter.ListView == ListView.LAST_30_DAYS);
    }
}

public class AdvancedSpecificationPurchaseOrder : Specification<PurchaseOrder>
{
    public AdvancedSpecificationPurchaseOrder(AdvancedFilterPurchaseOrder filter)
    {
        DateTime today = DateTime.UtcNow;
        var todayrange = today.GetDateRange("TODAY", filter.CurrentUser.LocalTimeOffset);
        var last30daysrange = today.GetDateRange("LAST_30_DAYS", filter.CurrentUser.LocalTimeOffset);
        Query.Where(x => x.Id != null)
             .Where(x => x.PurchaseOrderNo.Contains(filter.Keyword), !string.IsNullOrEmpty(filter.Keyword))
             .Where(x => x.PurchaseOrderDate >= filter.PurchaseOrderDate && x.PurchaseOrderDate <= filter.PurchaseOrderDate)

             .Where(x => x.CreatedBy == filter.CurrentUser.UserId, filter.ListView == ListView.My)
             .Where(x => x.Created >= todayrange.Start && x.Created < todayrange.End.AddDays(1), filter.ListView == ListView.TODAY)
             .Where(x => x.Created >= last30daysrange.Start, filter.ListView == ListView.LAST_30_DAYS);
    }
}
