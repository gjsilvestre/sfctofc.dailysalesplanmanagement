using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

using SFCTOFC.DailySalesPlanManagementDomain.Entities;
namespace SFCTOFC.DailySalesPlanManagementInfrastructure.Persistence.Configurations;

public class MenuSectionConfiguration : IEntityTypeConfiguration<MenuSection>
{
    public void Configure(EntityTypeBuilder<MenuSection> builder)
    {
        builder.HasKey(x => x.Id);
        builder.HasMany(x => x.MenuItems)
               .WithOne(x => x.Section)
               .HasForeignKey(x => x.SectionId);
    }
}

public class MenuItemConfiguration : IEntityTypeConfiguration<MenuItem>
{
    public void Configure(EntityTypeBuilder<MenuItem> builder)
    {
        builder.HasKey(x => x.Id);
        builder.HasMany(x => x.MenuSubItems)
               .WithOne(x => x.MenuItem)
               .HasForeignKey(x => x.MenuItemId);
    }
}

public class MenuSubItemConfiguration : IEntityTypeConfiguration<MenuSubItem>
{
    public void Configure(EntityTypeBuilder<MenuSubItem> builder)
    {
        builder.HasKey(x => x.Id);
    }
}
