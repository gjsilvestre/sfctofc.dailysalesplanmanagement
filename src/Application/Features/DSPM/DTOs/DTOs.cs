
using System.ComponentModel.DataAnnotations.Schema;

namespace SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.DTOs;

public class SalesmanDailyPlansDto
{
    public int Id { get; set; } // SalesmanDailyPlanId
    public int UserId { get; set; } // Salesman
    public string UserName { get; set; } // Salesman name
    //  FK that already exists in DB
    public int OutletId { get; set; }

    // ONE navigation only
    [ForeignKey(nameof(OutletId))]
    public DistributorOutlet? Outlet { get; set; }

    public string OutletName { get; set; } // DistributorOutlet name
    public DateTime? PlanDate { get; set; }


    public decimal? TargetSales { get; set; }
    public int? TargetQty { get; set; }
    public decimal? ActualSales { get; set; }
    public string? Frequency { get; set; }
    public string? Status { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
    public DateTime? CheckedIn { get; set; }
    public DateTime? CheckedOut { get; set; }
    public DateTime? Skipped { get; set; }
    public string? SelfiePath { get; set; }
    public TimeSpan? CallTime { get; set; }
    public string? SkippedRemarks { get; set; }

    public ICollection<OutletTasks> Tasks { get; set; }

    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<OutletTasks, OutletTasksDto>()
                .ForMember(d => d.OutletName,
                    o => o.MapFrom(s => s.DailyPlan!.Outlet!.Name))

                .ForMember(d => d.OutletAddress,
                    o => o.MapFrom(s => s.DailyPlan!.Outlet!.Address))

                .ForMember(d => d.OutletCity,
                    o => o.MapFrom(s => s.DailyPlan!.Outlet!.City))

                .ForMember(d => d.OutletProvince,
                    o => o.MapFrom(s => s.DailyPlan!.Outlet!.Province))

                .ReverseMap();
        }
    }

}

public class OutletTasksDto
{
    public int Id { get; set; }

    // link to daily plan

    public int SalesmanDailyPlanId { get; set; }

    [ForeignKey(nameof(SalesmanDailyPlanId))]
    public SalesmanDailyPlans? DailyPlan { get; set; }


    public int CreatedByUserId { get; set; }

    [ForeignKey(nameof(CreatedByUserId))]
    public Users? CreatedBy { get; set; }


    public int? AssignedToUserId { get; set; }

    [ForeignKey(nameof(AssignedToUserId))]
    public Users? AssignedTo { get; set; }

    public string? TaskName { get; set; }
    public string? Notes { get; set; }

    public string? CompletedRemarks { get; set; }


    public bool? IsCompleted { get; set; } = false;
    public DateTime? CompletedAt { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    //for displaying
    public string? OutletName { get; set; }
    public string? OutletAddress { get; set; }
    public string? OutletCity { get; set; }
    public string? OutletProvince { get; set; }
    public string? OutletRegion { get; set; }


    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<OutletTasks, OutletTasksDto>()
                .ForMember(d => d.OutletName,
                    opt => opt.MapFrom(s => s.DailyPlan.Outlet.Name))
                .ForMember(d => d.OutletAddress,
                    opt => opt.MapFrom(s => s.DailyPlan.Outlet.Address))
                .ForMember(d => d.OutletProvince,
                    opt => opt.MapFrom(s => s.DailyPlan.Outlet.Province))
                .ForMember(d => d.OutletRegion,
                    opt => opt.MapFrom(s => s.DailyPlan.Outlet.Region));

            CreateMap<OutletTasksDto, OutletTasks>(MemberList.None);
        }
    }

}

public class UsersDto
{
    public int Id { get; set; }
    public string? UserName { get; set; }
    public string? FirstName { get; set; }
    public string? LastName { get; set; }
    public string? PasswordHash { get; set; }
    public string? Email { get; set; }
    public string? Position { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }

    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<Users, UsersDto>().ReverseMap();
            CreateMap<UsersDto, Users>(MemberList.None);
        }
    }
}


#region OUTLETS

public class OutletsDto
{
    public int Id { get; set; }
    public string? Distributor { get; set; }
    public string? Salesman { get; set; }
    public string? Name { get; set; }
    public string? Channel { get; set; }
    public string? Owner { get; set; }
    public string? PhoneNumber { get; set; }
    public string? Address { get; set; }
    public string? Region { get; set; }
    public string? Province { get; set; }
    public string? City { get; set; }
    public string? Baranggay { get; set; }
    public string? Route { get; set; }
    public string? Frequency { get; set; }
    public int? CallSequence { get; set; }
    public string? Image { get; set; }
    public double? Latitude { get; set; } //float sa mssql
    public double? Longtitude { get; set; } //float sa mssql 
    public string? Comments { get; set; }
    public string? SubRoute1 { get; set; }
    public string? SubRoute2 { get; set; }
    public string? SubRoute3 { get; set; }
    public string? SubRoute4 { get; set; }
    public string? Supervisor { get; set; }
    public string? BusinessDivision { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<DistributorOutlet, OutletsDto>().ReverseMap();
            CreateMap<OutletsDto, DistributorOutlet>(MemberList.None);
        }
    }
}

//public class OutletDto
//{
//    public int Id { get; set; }
//    public string? ExternalId { get; set; }
//    public string? Name { get; set; }
//    public string? Address { get; set; }
//    public string? Barangay { get; set; }
//    public string? City { get; set; }
//    public string? Province { get; set; }
//    public string? Region { get; set; }
//    public decimal? Latitude { get; set; }
//    public decimal? Longitude { get; set; }
//    public string? Channel { get; set; }
//    public string? Salesman { get; set; }
//    public string? Supervisor { get; set; }
//    public string? BusinessDivision { get; set; }
//    public string? Route { get; set; }
//    public int? CallSequence { get; set; }
//    public string? Image { get; set; }

//    private class Mapping : Profile
//    {
//        public Mapping()
//        {
//            CreateMap<Outlets, OutletDto>().ReverseMap();
//            CreateMap<OutletDto, Outlets>(MemberList.None);
//        }
//    }
//}

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
    public decimal? TotalAmount { get; set; }

    public List<PurchaseOrderDetailsDto>? Details { get; set; }
    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<PurchaseOrder, PurchaseOrderDto>();

            CreateMap<PurchaseOrderDto, PurchaseOrder>()
                .ForMember(dest => dest.CreatedByUser, opt => opt.Ignore())
                .ForMember(dest => dest.LastModifiedByUser, opt => opt.Ignore())
                .ForMember(dest => dest.Details, opt => opt.Ignore());
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