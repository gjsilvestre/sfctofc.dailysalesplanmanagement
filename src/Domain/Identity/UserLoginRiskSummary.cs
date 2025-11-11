using SFCTOFC.DailySalesPlanManagementDomain.Common.Entities;
using SFCTOFC.DailySalesPlanManagementDomain.Enums;

namespace SFCTOFC.DailySalesPlanManagementDomain.Identity;
public class UserLoginRiskSummary : BaseAuditableEntity
{
    public string UserId { get; set; }= string.Empty;
    public string UserName { get; set; } = string.Empty;
    public SecurityRiskLevel RiskLevel { get; set; }
    public int RiskScore { get; set; }
    public string? Description { get; set; }
    public string? Advice { get; set; }

}


