
using SFCTOFC.DailySalesPlanManagement.Domain.Common.Entities;
using SFCTOFC.DailySalesPlanManagement.Domain.Identity;

namespace SFCTOFC.DailySalesPlanManagement.Domain.Entities;
public class SalesOrderDetails : BaseAuditableEntity
{
    public int? SalesOrderId { get; set; }
    public string? SKUNumber { get; set; }
    public string? UPC { get; set; }
    public string? Description { get; set; }
    public string? Units { get; set; }
    public decimal? Discount { get; set; }
    public decimal? Package { get; set; }
    public decimal? Quantity { get; set; }
    public decimal? BuyCost { get; set; }
    public decimal? Amount { get; set; }
    public virtual ApplicationUser? CreatedByUser { get; set; }
    public virtual ApplicationUser? LastModifiedByUser { get; set; }
}
