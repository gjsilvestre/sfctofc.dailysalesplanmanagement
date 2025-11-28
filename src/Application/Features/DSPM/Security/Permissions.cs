
namespace SFCTOFC.DailySalesPlanManagement.Application.Common.Security;

public static partial class Permissions
{
    [DisplayName("Salesman Tracker Permissions")]
    [Description("Set permissions for Salesman Tracker operations")]
    public static class SalesmanTracker
    {
        [Description("Allows viewing records")]
        public const string View = "Permissions.SalesmanTracker.View";

        [Description("Allows creating new records")]
        public const string Create = "Permissions.SalesmanTracker.Create";

        [Description("Allows modifying existing records")]
        public const string Edit = "Permissions.SalesmanTracker.Edit";

        [Description("Allows deleting records")]
        public const string Delete = "Permissions.SalesmanTracker.Delete";

        [Description("Allows printing records")]
        public const string Print = "Permissions.SalesmanTracker.Print";

        [Description("Allows searching for records")]
        public const string Search = "Permissions.SalesmanTracker.Search";

        [Description("Allows exporting records")]
        public const string Export = "Permissions.SalesmanTracker.Export";

        [Description("Allows importing records")]
        public const string Import = "Permissions.SalesmanTracker.Import";
    }

    [DisplayName("Purchase Order Permissions")]
    [Description("Set permissions for Purchase Order operations")]
    public static class PurchaseOrder
    {
        [Description("Allows viewing records")]
        public const string View = "Permissions.PurchaseOrder.View";

        [Description("Allows creating new records")]
        public const string Create = "Permissions.PurchaseOrder.Create";

        [Description("Allows modifying existing records")]
        public const string Edit = "Permissions.PurchaseOrder.Edit";

        [Description("Allows deleting records")]
        public const string Delete = "Permissions.PurchaseOrder.Delete";

        [Description("Allows printing records")]
        public const string Print = "Permissions.PurchaseOrder.Print";

        [Description("Allows searching for records")]
        public const string Search = "Permissions.PurchaseOrder.Search";

        [Description("Allows exporting records")]
        public const string Export = "Permissions.PurchaseOrder.Export";

        [Description("Allows importing records")]
        public const string Import = "Permissions.PurchaseOrder.Import";
    }

    [DisplayName("Sales Order Permissions")]
    [Description("Set permissions for Sales Order operations")]
    public static class SalesOrder
    {
        [Description("Allows viewing records")]
        public const string View = "Permissions.SalesOrder.View";

        [Description("Allows creating new records")]
        public const string Create = "Permissions.SalesOrder.Create";

        [Description("Allows modifying existing records")]
        public const string Edit = "Permissions.SalesOrder.Edit";

        [Description("Allows deleting records")]
        public const string Delete = "Permissions.SalesOrder.Delete";

        [Description("Allows printing records")]
        public const string Print = "Permissions.SalesOrder.Print";

        [Description("Allows searching for records")]
        public const string Search = "Permissions.SalesOrder.Search";

        [Description("Allows exporting records")]
        public const string Export = "Permissions.SalesOrder.Export";

        [Description("Allows importing records")]
        public const string Import = "Permissions.SalesOrder.Import";
    }

    [DisplayName("Outlet Permissions")]
    [Description("Set permissions for Sales Order operations")]
    public static class Outlet
    {
        [Description("Allows viewing records")]
        public const string View = "Permissions.Outlet.View";

        [Description("Allows creating new records")]
        public const string Create = "Permissions.Outlet.Create";

        [Description("Allows modifying existing records")]
        public const string Edit = "Permissions.Outlet.Edit";

        [Description("Allows deleting records")]
        public const string Delete = "Permissions.Outlet.Delete";

        [Description("Allows printing records")]
        public const string Print = "Permissions.Outlet.Print";

        [Description("Allows searching for records")]
        public const string Search = "Permissions.Outlet.Search";

        [Description("Allows exporting records")]
        public const string Export = "Permissions.Outlet.Export";

        [Description("Allows importing records")]
        public const string Import = "Permissions.Outlet.Import";
    }
}


public class SalesmanTrackerAccessRights
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

public class PurchaseOrderAccessRights
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

public class SalesOrderAccessRights
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

public class OutletAccessRights
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