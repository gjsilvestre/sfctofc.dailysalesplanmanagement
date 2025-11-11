
namespace SFCTOFC.DailySalesPlanManagementApplication.Common.Security;
public static partial class Permissions
{
    [DisplayName("Sales To Trade Dashboard Permissions")]
    [Description("Set permissions for Dashboard operations")]
    public static class SalesToTradeDashboard
    {
        [Description("Allows viewing Dashbaord details")]
        public const string View = "Permissions.SalesToTradeDashboard.View";

        [Description("Allows creating new Dashbaord records")]
        public const string Create = "Permissions.SalesToTradeDashboard.Create";

        [Description("Allows modifying existing Dashbaord details")]
        public const string Edit = "Permissions.SalesToTradeDashboard.Edit";

        [Description("Allows deleting Dashbaord records")]
        public const string Delete = "Permissions.SalesToTradeDashboard.Delete";

        [Description("Allows printing Dashbaord details")]
        public const string Print = "Permissions.SalesToTradeDashboard.Print";

        [Description("Allows searching for Dashbaord records")]
        public const string Search = "Permissions.SalesToTradeDashboard.Search";

        [Description("Allows exporting Dashbaord records")]
        public const string Export = "Permissions.SalesToTradeDashboard.Export";

        [Description("Allows importing Dashbaord records")]
        public const string Import = "Permissions.SalesToTradeDashboard.Import";
    }
}
public class SalesToTradeDashboardAccessRights
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