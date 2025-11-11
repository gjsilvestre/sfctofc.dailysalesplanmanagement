using SFCTOFC.DailySalesPlanManagementServer.UI.Models.NavigationMenu;

namespace SFCTOFC.DailySalesPlanManagementServer.UI.Services.Navigation;

public interface IMenuService
{
    IEnumerable<MenuSectionModel> Features { get; }
 
}

