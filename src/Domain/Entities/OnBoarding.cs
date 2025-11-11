using System.Globalization;
using SFCTOFC.DailySalesPlanManagementDomain.Common.Entities;
using SFCTOFC.DailySalesPlanManagementDomain.Identity;

namespace SFCTOFC.DailySalesPlanManagementDomain.Entities;
public class OnBoarding : BaseAuditableEntity, IMayHaveTenant, IAuditTrial
{
    public Guid? RefId { get; set; }
    public string? EmployeeNo { get; set; }
    public DateTime? StartDate { get; set; }
    public DateTime? EndDate { get; set; }
    public string? Status { get; set; }

    public virtual Tenant? Tenant { get; set; }
    public string? TenantId { get; set; }
    public string? TenantName { get; set; }

    public virtual ApplicationUser? CreatedByUser { get; set; }
    public virtual ApplicationUser? LastModifiedByUser { get; set; }
}
