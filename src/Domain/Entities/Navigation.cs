using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFCTOFC.DailySalesPlanManagementDomain.Entities;
public class MenuSection
{
    public int Id { get; set; }
    public string Title { get; set; } = string.Empty;
    public string? Roles { get; set; }
    public int SortOrder { get; set; }
    public bool IsActive { get; set; } = true;

    public ICollection<MenuItem> MenuItems { get; set; } = new List<MenuItem>();
}

public class MenuItem
{
    public int Id { get; set; }
    public int SectionId { get; set; }
    public string Title { get; set; } = string.Empty;
    public string? Icon { get; set; }
    public string? Href { get; set; }
    public int PageStatus { get; set; }
    public bool IsParent { get; set; }
    public string? Roles { get; set; }
    public int SortOrder { get; set; }
    public bool IsActive { get; set; } = true;

    public MenuSection Section { get; set; } = default!;
    public ICollection<MenuSubItem> MenuSubItems { get; set; } = new List<MenuSubItem>();
}

public class MenuSubItem
{
    public int Id { get; set; }
    public int MenuItemId { get; set; }
    public string Title { get; set; } = string.Empty;
    public string? Icon { get; set; }
    public string Href { get; set; } = string.Empty;
    public int PageStatus { get; set; }
    public string? Target { get; set; }
    public int SortOrder { get; set; }
    public bool IsActive { get; set; } = true;

    public MenuItem MenuItem { get; set; } = default!;
}