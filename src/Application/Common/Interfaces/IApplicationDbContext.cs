
using SFCTOFC.DailySalesPlanManagement.Domain.Entities;
using SFCTOFC.DailySalesPlanManagement.Domain.Identity;
using Microsoft.AspNetCore.DataProtection.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;

namespace SFCTOFC.DailySalesPlanManagement.Application.Common.Interfaces;

public interface IApplicationDbContext: IAsyncDisposable
{
    #region DSPM
    DbSet<Outlets> Outlets { get; set; }
    DbSet<SalesmanTracker> SalesmanTracker { get; set; }
    DbSet<PurchaseOrder> PurchaseOrder { get; set; }
    DbSet<PurchaseOrderDetails> PurchaseOrderDetails { get; set; }
    DbSet<SalesOrder> SalesOrder { get; set; }
    DbSet<SalesOrderDetails> SalesOrderDetails { get; set; }

     DbSet<Users> Users { get; set; }
     DbSet<SalesmanDailyPlans> SalesmanDailyPlans { get; set; }
     DbSet<DistributorOutlet> DistributorOutlet { get; set; }
     DbSet<OutletSalesOrder> OutletSalesOrder { get; set; }
    DbSet<MBLProducts> MBLProducts { get; set; }
    DbSet<OutletTasks> OutletTasks { get; set; }

    #endregion

    #region DEFAULT ENTITIES
    DbSet<SystemLog> SystemLogs { get; set; }
    DbSet<AuditTrail> AuditTrails { get; set; }
    DbSet<Document> Documents { get; set; }
    DbSet<PicklistSet> PicklistSets { get; set; }
    DbSet<Product> Products { get; set; }
    DbSet<Tenant> Tenants { get; set; }
    DbSet<Contact> Contacts { get; set; }
    DbSet<LoginAudit> LoginAudits { get; set; }
    DbSet<UserLoginRiskSummary> UserLoginRiskSummaries { get; set; }
    #endregion

    #region REFERENCES
    DbSet<Brands> Brands { get; set; }
    #endregion

    ChangeTracker ChangeTracker { get; }
    DbSet<DataProtectionKey> DataProtectionKeys { get; set; }

    Task<int> SaveChangesAsync(CancellationToken cancellationToken);
}