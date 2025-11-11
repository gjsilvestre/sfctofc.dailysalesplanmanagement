
namespace SFCTOFC.DailySalesPlanManagementApplication.Common.Security;
public static partial class Permissions
{
    [DisplayName("Sales To Trade KPI Permissions")]
    [Description("Set permissions for STT KPI operations")]
    public static class SalesToTradeKPIReport
    {
        [Description("Allows viewing Sales To Trade KPI details")]
        public const string View = "Permissions.SalesToTradeKPIReport.View";

        [Description("Allows creating new Sales To Trade KPI records")]
        public const string Create = "Permissions.SalesToTradeKPIReport.Create";

        [Description("Allows modifying existing Sales To Trade KPI details")]
        public const string Edit = "Permissions.SalesToTradeKPIReport.Edit";

        [Description("Allows deleting Sales To Trade KPI records")]
        public const string Delete = "Permissions.SalesToTradeKPIReport.Delete";

        [Description("Allows printing Sales To Trade KPI details")]
        public const string Print = "Permissions.SalesToTradeKPIReport.Print";

        [Description("Allows searching for Sales To Trade KPI records")]
        public const string Search = "Permissions.SalesToTradeKPIReport.Search";

        [Description("Allows exporting Sales To Trade KPI records")]
        public const string Export = "Permissions.SalesToTradeKPIReport.Export";

        [Description("Allows importing Sales To Trade KPI records")]
        public const string Import = "Permissions.SalesToTradeKPIReport.Import";
    }
}
public class SalesToTradeKPIReportAccessRights
{
    public bool View { get; set; }
    public bool Create { get; set; }
    public bool Edit { get; set; }
    public bool Delete { get; set; }
    public bool Print { get; set; }
    public bool Search { get; set; }
    public bool Export { get; set; }
    public bool Import { get; set; }
}