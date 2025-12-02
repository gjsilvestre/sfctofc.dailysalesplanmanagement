using SFCTOFC.DailySalesPlanManagement.Application.Common.Constants.Roles;
using SFCTOFC.DailySalesPlanManagement.Server.UI.Models.NavigationMenu;
using static MudBlazor.CategoryTypes;

namespace SFCTOFC.DailySalesPlanManagement.Server.UI.Services.Navigation;

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
                    IsParent = true,
                    Title = "APPLICATIONS",
                    Icon = Icons.Material.Filled.Apps,
                    MenuItems = new List<MenuSectionSubItemModel>
                    {
                        new()
                        {
                            Title = "Dashboard",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/",
                            PageStatus = PageStatus.ComingSoon
                        },
                        new()
                        {
                            Title = "Overview",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/",
                            PageStatus = PageStatus.ComingSoon
                        },
                    }
                },
                new() {
                    IsParent = true,
                    Title = "SALES",
                    Icon = Icons.Material.Filled.Ballot,
                    MenuItems = new List<MenuSectionSubItemModel>
                    {
                        new()
                        {
                            Title = "Purchase Orders",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/pages/purchaseorder",
                            PageStatus = PageStatus.Completed
                        },
                        new()
                        {
                            Title = "Sales Orders",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/",
                            PageStatus = PageStatus.ComingSoon
                        },
                        new()
                        {
                            Title = "Delivery Receipt",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/",
                            PageStatus = PageStatus.ComingSoon
                        },
                    }
                },
                new() {
                    IsParent = true,
                    Title = "CRM",
                    Icon = Icons.Material.Filled.CoPresent,
                    MenuItems = new List<MenuSectionSubItemModel>
                    {
                        new()
                        {
                            Title = "Activities",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/",
                            PageStatus = PageStatus.ComingSoon
                        },
                        new()
                        {
                            Title = "Task (Special Instruction)",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/",
                            PageStatus = PageStatus.ComingSoon
                        },
                    }
                },
                new() {
                    IsParent = true,
                    Title = "MASTER DATA",
                    Icon = Icons.Material.Filled.ImportantDevices,
                    MenuItems = new List<MenuSectionSubItemModel>
                    {
                        new()
                        {
                            Title = "Outlets",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/pages/outlet",
                            PageStatus = PageStatus.Completed
                        },
                        new()
                        {
                            Title = "Products",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/",
                            PageStatus = PageStatus.ComingSoon
                        },
                        new()
                        {
                            Title = "Salesman",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/",
                            PageStatus = PageStatus.ComingSoon
                        },
                    }
                },
                new() {
                    IsParent = true,
                    Title = "REPORTS",
                    Icon = Icons.Material.Filled.Report,
                    MenuItems = new List<MenuSectionSubItemModel>
                    {
                        new()
                        {
                            Title = "STT Data",
                            //Icon = Icons.Material.Filled.ArrowRight,
                            Href = "/",
                            PageStatus = PageStatus.ComingSoon
                        },
                    }
                },
            }
        },
        new MenuSectionModel
        {
            Title = "SYSTEM MANAGEMENT",
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