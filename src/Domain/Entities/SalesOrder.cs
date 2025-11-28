
using SFCTOFC.DailySalesPlanManagement.Domain.Common.Entities;
using SFCTOFC.DailySalesPlanManagement.Domain.Identity;


namespace SFCTOFC.DailySalesPlanManagement.Domain.Entities;

public class SalesOrder : BaseAuditableEntity
{
    public string? RefId { get; set; }
    public int? CustomerId { get; set; }
    public string? SONumber { get; set; }
    public string? PONumber { get; set; }
    public string? DeliveryNotice { get; set; }
    public string? DeliveryAaddress { get; set; }
    public DateTime? OrderDate { get; set; }
    public DateTime? ShipDate { get; set; }
    public DateTime? CancelDate { get; set; }
    public string? Currency { get; set; }
    public virtual ApplicationUser? CreatedByUser { get; set; }
    public virtual ApplicationUser? LastModifiedByUser { get; set; }
}
