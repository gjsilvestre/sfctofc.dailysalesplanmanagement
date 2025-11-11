using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.References.REFBrand.Specifications;
public enum BrandListView
{
    [Description("All")] All,
    [Description("My Products")] My,
    [Description("Created Today")] TODAY,

    [Description("Created within the last 30 days")]
    LAST_30_DAYS
}
