using SFCTOFC.DailySalesPlanManagement.Domain.Common.Entities;
using SFCTOFC.DailySalesPlanManagement.Domain.Identity;

namespace SFCTOFC.DailySalesPlanManagement.Domain.Entities;

public class PurchaseOrderDetails : BaseAuditableEntity
{
    public int PurchaseOrderId { get; set; }
    public string? SKUNo { get; set; }
    public string? UPC { get; set; }
    public string? Description { get; set; }
    public int? Quantity { get; set; }
    public string? UOM { get; set; }
    public decimal? BuyCost { get; set; }
    public decimal? Amount { get; set; }
    public virtual PurchaseOrder? PurchaseOrder { get; set; }
    public virtual ApplicationUser? CreatedByUser { get; set; }
    public virtual ApplicationUser? LastModifiedByUser { get; set; }
}
