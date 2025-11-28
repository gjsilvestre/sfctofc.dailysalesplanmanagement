
namespace SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.DTOs;

#region OUTLETS

public class OutletDto
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
    public string? Image { get; set; }

    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<Outlets, OutletDto>().ReverseMap();
            CreateMap<OutletDto, Outlets>(MemberList.None);
        }
    }
}

#endregion

#region SALESMANTRACKER

public class SalesmanTrackerDto
{
    public int Id { get; set; }
    public string? AspNetUserId { get; set; }
    public string? Name { get; set; }
    public DateTime? Date { get; set; }
    public decimal? ActualSales { get; set; }
    public decimal? TargetSales { get; set; }
    public int? ActualStoreVisited { get; set; }
    public int? TargetStoreVisited { get; set; }
    public int? Skipped { get; set; }

    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<SalesmanTracker, SalesmanTrackerDto>().ReverseMap();
            CreateMap<SalesmanTrackerDto, SalesmanTracker>(MemberList.None);
        }
    }
}

#endregion

#region PURCHASE ORDER

public class PurchaseOrderDto
{
    public int Id { get; set; }
    public string? PurchaseOrderNo { get; set; }
    public DateTime? PurchaseOrderDate { get; set; }
    public int? OutletId { get; set; }
    public string? OutletName { get; set; }
    public string? OutletAddress { get; set; }
    public string? OutletProvince { get; set; }
    public string? OutletRegion { get; set; }
    public string? VendorName { get; set; }
    public string? VendorAddress { get; set; }
    public DateTime? DeliveryDate { get; set; }
    public DateTime? CancelDate { get; set; }
    public string? Salesman { get; set; }
    public string? Status { get; set; }
    public string? RefPONo { get; set; }
    
    public List<PurchaseOrderDetailsDto>? Details { get; set; }
    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<PurchaseOrder, PurchaseOrderDto>().ReverseMap();
            CreateMap<PurchaseOrderDto, PurchaseOrder>(MemberList.None);
            CreateMap<PurchaseOrderDetails, PurchaseOrderDetailsDto>().ReverseMap();
            CreateMap<PurchaseOrderDetailsDto, PurchaseOrderDetails>(MemberList.None);
        }
    }
}

public class PurchaseOrderDetailsDto
{
    public int Id { get; set; }
    public int PurchaseOrderId { get; set; }
    public string? SKUNo { get; set; }
    public string? UPC { get; set; }
    public string? Description { get; set; }
    public int? Quantity { get; set; }
    public string? UOM { get; set; }
    public decimal? BuyCost { get; set; }
    public decimal? Amount { get; set; }

    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<PurchaseOrderDetails, PurchaseOrderDetailsDto>().ReverseMap();
            CreateMap<PurchaseOrderDetailsDto, PurchaseOrderDetails>(MemberList.None);
        }
    }
}

public class PurchaseOrderPrintingDto
{
    public string? PurchaseOrderNo { get; set; }
    public DateTime? PurchaseOrderDate { get; set; }
    public string? OutletName { get; set; }
    public string? OutletAddress { get; set; }
    public string? OutletProvince { get; set; }
    public string? OutletRegion { get; set; }
    public DateTime? DeliveryDate { get; set; }
    public DateTime? CancelDate { get; set; }
    public string? SKUNo { get; set; }
    public string? UPC { get; set; }
    public string? Description { get; set; }
    public int? Quantity { get; set; }
    public string? UOM { get; set; }
    public decimal? BuyCost { get; set; }
    public decimal? Amount { get; set; }
}

#endregion

#region SALES ORDER

public class SalesOrderDto
{
    public int Id { get; set; }
    public string? RefId { get; set; }
    public int? CustomerId { get; set; }
    public string? SONumber { get; set; }
    public string? PONumber { get; set; }
    public string? DeliveryNotice { get; set; }
    public string? DeliveryAddress { get; set; }
    public DateTime? OrderDate { get; set; }
    public DateTime? ShipDate { get; set; }
    public DateTime? CancelDate { get; set; }
    public string? Currency { get; set; }
    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<SalesOrder, SalesOrderDto>().ReverseMap();
            CreateMap<SalesOrderDto, SalesOrder>(MemberList.None);
        }
    }
}

public class SalesOrderDetailsDto
{
    public int Id { get; set; }
    public int SalesOrderId { get; set; }
    public string? SKUNumber { get; set; }
    public string? UPC { get; set; }
    public string? Description { get; set; }
    public string? Units { get; set; }
    public decimal? Discount { get; set; }
    public decimal? Package { get; set; }
    public decimal? Quantity { get; set; }
    public decimal? BuyCost { get; set; }
    public decimal? Amount { get; set; }

    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<SalesOrderDetails, SalesOrderDetailsDto>().ReverseMap();
            CreateMap<SalesOrderDetailsDto, SalesOrderDetails>(MemberList.None);
        }
    }
}

#endregion