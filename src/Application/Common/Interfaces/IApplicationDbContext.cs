
using SFCTOFC.DailySalesPlanManagementDomain.Entities;
using SFCTOFC.DailySalesPlanManagementDomain.Identity;
using Microsoft.AspNetCore.DataProtection.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;

namespace SFCTOFC.DailySalesPlanManagementApplication.Common.Interfaces;

public interface IApplicationDbContext: IAsyncDisposable
{
    #region DSPM
    DbSet<Outlets> Outlets { get; set; }
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