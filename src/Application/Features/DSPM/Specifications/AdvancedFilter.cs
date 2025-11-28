
namespace SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.Specifications;

public class AdvancedFilterSalesmanTracker : PaginationFilter
{
    public int Id { get; set; }
    public string? AspNetUserId { get; set; }
    public string? Name { get; set; }
    public DateTime? Date { get; set; }
    public decimal? ActualSales { get; set; }
    public decimal? TargetSales { get; set; }
    public int? ActualStoreVisited { get; set; }
    public int? TargetStoreVisited { get; set; }
    public ListView ListView { get; set; } = ListView.All;
    public UserProfile? CurrentUser { get; set; }
}

public class AdvancedFilterPurchaseOrder : PaginationFilter
{
    public int Id { get; set; }
    public string? PurchaseOrderNo { get; set; }
    public DateTime? PurchaseOrderDate { get; set; }
    public int? OutletId { get; set; }
    public string? VendorName { get; set; }
    public string? VendorAddress { get; set; }
    public DateTime? DeliveryDate { get; set; }
    public DateTime? CancelDate { get; set; }
    public ListView ListView { get; set; } = ListView.All;
    public UserProfile? CurrentUser { get; set; }
}

public class AdvancedFilterOutlet : PaginationFilter
{
    public int Id { get; set; }
    public string? ExternalId { get; set; }
    public string? Name { get; set; }
    public string? Address { get; set; }
    public string? Barangay { get; set; }
    public string? City { get; set; }
    public string? Province { get; set; }
    public string? Region { get; set; }
    public decimal? Latitude { get; set; }
    public decimal? Longitude { get; set; }
    public string? Channel { get; set; }
    public string? Salesman { get; set; }
    public string? Supervisor { get; set; }
    public string? BusinessDivision { get; set; }
    public string? Route { get; set; }
    public int? CallSequence { get; set; }
    public ListView ListView { get; set; } = ListView.All;
    public UserProfile? CurrentUser { get; set; }
}