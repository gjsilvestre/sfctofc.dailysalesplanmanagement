// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

using System.Reflection;
using Microsoft.AspNetCore.DataProtection.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using SFCTOFC.DailySalesPlanManagementDomain.Common.Entities;
using SFCTOFC.DailySalesPlanManagementDomain.Entities;
using SFCTOFC.DailySalesPlanManagementDomain.Identity;

namespace SFCTOFC.DailySalesPlanManagementInfrastructure.Persistence;

#nullable disable
public class ApplicationDbContext : IdentityDbContext<
    ApplicationUser, ApplicationRole, string,
    ApplicationUserClaim, ApplicationUserRole, ApplicationUserLogin,
    ApplicationRoleClaim, ApplicationUserToken>, IApplicationDbContext, IDataProtectionKeyContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }

    #region DSPM
    public DbSet<Outlets> Outlets { get; set; }
    #endregion

    #region DEFAULT ENTITIES
    public DbSet<Tenant> Tenants { get; set; }
    public DbSet<SystemLog> SystemLogs { get; set; }
    public DbSet<AuditTrail> AuditTrails { get; set; }
    public DbSet<Document> Documents { get; set; }
    public DbSet<PicklistSet> PicklistSets { get; set; }
    public DbSet<Product> Products { get; set; }
    public DbSet<Contact> Contacts { get; set; }
    public DbSet<LoginAudit> LoginAudits { get; set; }
    public DbSet<UserLoginRiskSummary> UserLoginRiskSummaries { get; set; }
    public DbSet<DataProtectionKey> DataProtectionKeys { get; set; }
    #endregion

    #region REFRENCES
    public DbSet<Brands> Brands { get; set; }
    #endregion

    public DbSet<MenuSection> MenuSections { get; set; }
    public DbSet<MenuItem> MenuItems { get; set; }
    public DbSet<MenuSubItem> MenuSubItems { get; set; }

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);
        builder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
        builder.ApplyGlobalFilters<ISoftDelete>(s => s.Deleted == null);
    }

    protected override void ConfigureConventions(ModelConfigurationBuilder configurationBuilder)
    {
        base.ConfigureConventions(configurationBuilder);
        configurationBuilder.Properties<string>().HaveMaxLength(450);
    }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder
        .ConfigureWarnings(warnings =>
            warnings.Ignore(Microsoft.EntityFrameworkCore.Diagnostics.RelationalEventId.PendingModelChangesWarning));
    }
}