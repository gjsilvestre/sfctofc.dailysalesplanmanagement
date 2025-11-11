using SFCTOFC.DailySalesPlanManagementApplication.Common.Constants.Roles;
using SFCTOFC.DailySalesPlanManagementServer.UI.Models.NavigationMenu;
using static MudBlazor.CategoryTypes;

namespace SFCTOFC.DailySalesPlanManagementServer.UI.Services.Navigation;

public class MenuService : IMenuService
{
    private readonly List<MenuSectionModel> _features = new()
    {
        new MenuSectionModel
        {
            Title = "APPLICATION",
            SectionItems = new List<MenuSectionItemModel>
            {
                new() { 
                    Title = "DASHBOARD",
                    Icon = Icons.Material.Filled.Dashboard,
                    Href = "/" 
                },
                new()
                {
                    Title = "REFERENCES",
                    Roles = new[] { RoleName.Admin, RoleName.Users },
                    Icon = Icons.Material.Filled.People,
                    PageStatus = PageStatus.Completed,
                    IsParent = true,
                    MenuItems = new List<MenuSectionSubItemModel>
                    {
                        new()
                        {
                            Title = "Brands",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/pages/brand",
                            PageStatus = PageStatus.Completed
                        },
                     
                    }
                },
            }
        },
        new MenuSectionModel
        {
            Title = "MANAGEMENT",
            Roles = new[] { RoleName.Admin },
            SectionItems = new List<MenuSectionItemModel>
            {
                new()
                {
                    IsParent = true,
                    Title = "AUTHORIZATION",
                    Icon = Icons.Material.Filled.ManageAccounts,
                    MenuItems = new List<MenuSectionSubItemModel>
                    {
                        new()
                        {
                            Title = "Multi-Tenant",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/system/tenants",
                            PageStatus = PageStatus.Completed
                        },
                        new()
                        {
                            Title = "Users",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/identity/users",
                            PageStatus = PageStatus.Completed
                        },
                        new()
                        {
                            Title = "Roles",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/identity/roles",
                            PageStatus = PageStatus.Completed
                        },
                        new()
                        {
                            Title = "Profile",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/user/profile",
                            PageStatus = PageStatus.Completed
                        },
                        new()
                        {
                            Title = "Login History",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/pages/identity/loginaudits",
                            PageStatus = PageStatus.Completed
                        },
                    }
                },
                new()
                {
                    IsParent = true,
                    Title = "SYSTEM",
                    Icon = Icons.Material.Filled.Devices,
                    MenuItems = new List<MenuSectionSubItemModel>
                    {
                        new()
                        {
                            Title = "Picklist",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/system/picklistset",
                            PageStatus = PageStatus.Completed
                        },
                        new()
                        {
                            Title = "Audit Trails",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/system/audittrails",
                            PageStatus = PageStatus.Completed
                        },
                        new()
                        {
                            Title = "Logs",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/system/logs",
                            PageStatus = PageStatus.Completed
                        },
                        new()
                        {
                            Title = "Jobs",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/jobs",
                            PageStatus = PageStatus.Completed,
                            Target = "_blank"
                        }
                    }
                }
            
            }
        }
    };

    public IEnumerable<MenuSectionModel> Features => _features;
}