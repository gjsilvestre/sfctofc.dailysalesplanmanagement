using System.ComponentModel;

namespace SFCTOFC.DailySalesPlanManagementServer.UI.Models.NavigationMenu;

public enum PageStatus
{
    [Description("Coming Soon")] ComingSoon,
    [Description("WIP")] Wip,
    [Description("New")] New,
    [Description("Completed")] Completed,
    Disabled = 0,
    Enabled = 1,
}