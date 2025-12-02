

using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace SFCTOFC.DailySalesPlanManagement.Infrastructure.Persistence.Configurations;

#nullable disable
public class PurchaseOrderConfiguration : IEntityTypeConfiguration<PurchaseOrder>
{
    public void Configure(EntityTypeBuilder<PurchaseOrder> builder)
    {
        builder.Ignore(e => e.DomainEvents);
        builder.HasOne(x => x.CreatedByUser)
           .WithMany()
           .HasForeignKey(x => x.CreatedBy)
           .OnDelete(DeleteBehavior.Restrict);
        builder.HasOne(x => x.LastModifiedByUser)
            .WithMany()
            .HasForeignKey(x => x.LastModifiedBy)
            .OnDelete(DeleteBehavior.Restrict);
        builder.Navigation(e => e.CreatedByUser).AutoInclude();
        builder.Navigation(e => e.LastModifiedByUser).AutoInclude();
    }
}

public class PurchaseOrderDetailsConfiguration : IEntityTypeConfiguration<PurchaseOrderDetails>
{
    public void Configure(EntityTypeBuilder<PurchaseOrderDetails> builder)
    {
        builder.Ignore(e => e.DomainEvents);
        builder.HasOne(x => x.CreatedByUser)
           .WithMany()
           .HasForeignKey(x => x.CreatedBy)
           .OnDelete(DeleteBehavior.Restrict);
        builder.HasOne(x => x.LastModifiedByUser)
            .WithMany()
            .HasForeignKey(x => x.LastModifiedBy)
            .OnDelete(DeleteBehavior.Restrict);
        builder.Navigation(e => e.CreatedByUser).AutoInclude();
        builder.Navigation(e => e.LastModifiedByUser).AutoInclude();
    }
}

//public class SalesmanDailyPlanConfiguration : IEntityTypeConfiguration<MBLSalesmanDailyPlans>
//{
//    public void Configure(EntityTypeBuilder<MBLSalesmanDailyPlans> builder)
//    {
//        builder.Ignore(e => e.DomainEvents);
//        //builder.Ignore(e => e.DomainEvents);
//        //builder.HasOne(x => x.CreatedByUser)
//        //   .WithMany()
//        //   .HasForeignKey(x => x.CreatedBy)
//        //   .OnDelete(DeleteBehavior.Restrict);
//        //builder.HasOne(x => x.LastModifiedByUser)
//        //    .WithMany()
//        //    .HasForeignKey(x => x.LastModifiedBy)
//        //    .OnDelete(DeleteBehavior.Restrict);
//        //builder.Navigation(e => e.CreatedByUser).AutoInclude();
//        //builder.Navigation(e => e.LastModifiedByUser).AutoInclude();
//    }
//}