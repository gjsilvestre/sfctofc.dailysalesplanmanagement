using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFCTOFC.DailySalesPlanManagement.Domain.Entities;


public class MBLProducts
{
    public int Id { get; set; }
    public int StoreId { get; set; }
    public string? SFCCode { get; set; }
    public string? Principal { get; set; }
    public string? Description { get; set; }
    public string? Class { get; set; }
    public string? Category { get; set; }
    public string? SalesCategory { get; set; }
    public string? Brand { get; set; }
    public string? Unit { get; set; }
    public decimal? UnitPrice { get; set; }
    public string? SubCategory { get; set; }
    public decimal? BasePrice { get; set; }
    public decimal? PackSize { get; set; }
    public string? Rationalization { get; set; }
    public decimal? TransferPrice { get; set; }
    public decimal? SRPCase { get; set; }
    public decimal? SRPPack { get; set; }
    public string? Image { get; set; }
}

public class OutletSalesOrder
{
    public int Id { get; set; }
    public int? OutletId { get; set; }
    public int? ProductId { get; set; }
    public int? DailyPlanId { get; set; }
    public int? Inventory { get; set; }
    public string? InventoryUOM { get; set; }
    public int? LastDeliveredQty { get; set; }
    public string? LastDeliveredUOM { get; set; }
    public int? SuggestedOrderQty { get; set; }
    public string? SuggestedOrderUOM { get; set; }
    public int? ActualOrderQty { get; set; }
    public string? ActualOrderUOM { get; set; }
    public decimal? UnitPrice { get; set; }
    public decimal? TotalPrice { get; set; }
    public string? LastDelivered { get; set; }
    public int? SuggestedNextOrderQty { get; set; }
    public string? SuggestedNextOrderUOM { get; set; }

    public bool? IsDeleted { get; set; }
    public DateTime? DeletedAt { get; set; }

    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
}
public class OutletTasks
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


}


public class Outlets
{
    public int Id { get; set; }
    public string? Distributor { get; set; }
    public int Salesman { get; set; }
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
    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }

}
public class SalesmanDailyPlans
{
    [Key]
    public int Id { get; set; }
    public int UserId { get; set; } // from Users
    public int OutletId { get; set; }

    // ONE navigation only
    [ForeignKey(nameof(OutletId))]
    public Outlets? Outlet { get; set; }

    [ForeignKey(nameof(UserId))]
    public Users? User { get; set; }

    public decimal? TargetSales { get; set; }
    public int? TargetQty { get; set; }
    public decimal? ActualSales { get; set; }
    public string? Frequency { get; set; }
    public string? Status { get; set; }
    public DateTime? PlanDate { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
    public DateTime? CheckedIn { get; set; }
    public DateTime? CheckedOut { get; set; }
    public DateTime? Skipped { get; set; }
    public string? SelfiePath { get; set; }
    public TimeSpan? CallTime { get; set; }
    public string? SkippedRemarks { get; set; }
   
    public ICollection<OutletTasks> Tasks { get; set; }
}



public class Users
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
}
