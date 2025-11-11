using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.References.REFBrand.Specifications;
public class BrandAdvancedFilter : PaginationFilter
{
    public int Id { get; set; }
    public string? BrandCode { get; set; }
    public string? BrandName { get; set; }


    public BrandListView ListView { get; set; } = BrandListView.All;

    public UserProfile?
       CurrentUser
    { get; set; } // <-- This CurrentUser property gets its value from the information of

}
