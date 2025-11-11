using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace SFCTOFC.DailySalesPlanManagementInfrastructure.Persistence.Configurations;
public class BrandConfiguration : IEntityTypeConfiguration<Brands>
{
    public void Configure(EntityTypeBuilder<Brands> builder)
    {


        builder.HasKey(e => e.Id);
        //builder.Ignore(e => e.Id);
        builder.Ignore(e => e.Created);
        builder.Ignore(e => e.CreatedBy);
        builder.Ignore(e => e.LastModified);
        builder.Ignore(e => e.LastModifiedBy);
        builder.Ignore(e => e.DomainEvents);
        //builder.Navigation(e => e.CreatedBy).AutoInclude();
        //builder.Navigation(e => e.LastModifiedBy).AutoInclude();
        //builder.Navigation(e => e.Tenant).AutoInclude();
    }
}