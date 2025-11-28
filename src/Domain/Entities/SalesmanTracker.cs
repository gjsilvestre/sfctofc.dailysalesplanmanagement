
using SFCTOFC.DailySalesPlanManagement.Domain.Common.Entities;
using SFCTOFC.DailySalesPlanManagement.Domain.Identity;

namespace SFCTOFC.DailySalesPlanManagement.Domain.Entities;

public class SalesmanTracker : BaseAuditableEntity
{
    public string? AspNetUserId { get; set; }
    public string? Name { get; set; }
    public DateTime? Date { get; set; }
    public decimal? ActualSales { get; set; }
    public decimal? TargetSales { get; set; }
    public int? ActualStoreVisited { get; set; }
    public int? TargetStoreVisited { get; set; }
    public virtual Tenant? Tenant { get; set; }
    public string? TenantId { get; set; }
    public string? TenantName { get; set; }
    public virtual ApplicationUser? CreatedByUser { get; set; }
    public virtual ApplicationUser? LastModifiedByUser { get; set; }
}
