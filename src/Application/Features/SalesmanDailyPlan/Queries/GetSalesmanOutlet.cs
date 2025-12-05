using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.DTOs;

namespace SFCTOFC.DailySalesPlanManagement.Application.Features.SalesmanDailyPlan.Queries;

public record GetSalesmanOutletsQuery(
    string UserName,
    DateTime? Date
) : IRequest<List<SalesmanDailyPlansDto>>;


public class GetSalesmanOutletsQueryHandler
    : IRequestHandler<GetSalesmanOutletsQuery, List<SalesmanDailyPlansDto>>
{
    private readonly IApplicationDbContext _context;

    public GetSalesmanOutletsQueryHandler(IApplicationDbContext context)
    {
        _context = context;
    }

    public async Task<List<SalesmanDailyPlansDto>> Handle(
    GetSalesmanOutletsQuery request,
    CancellationToken cancellationToken)
    {
        var date = request.Date?.Date ?? DateTime.Today;
        var start = date.Date;
        var end = date.Date.AddDays(1);
        var users = await _context.SalesmanDailyPlans
        .Include(x => x.User)
        .Select(x => x.User.UserName)
        .Distinct()
        .ToListAsync(cancellationToken);

            foreach (var u in users)
            {
                Debug.WriteLine($"DB USER: '{u}'");
            }

        var plans = await _context.SalesmanDailyPlans
            .Include(x => x.User)
            .Include(x => x.Outlet)
            .Where(x =>
                x.User != null &&
                x.User.UserName != null &&
                x.User.UserName.ToLower().Trim() == request.UserName.ToLower().Trim() &&
                x.PlanDate >= start &&
                x.PlanDate < end
            )


            .Select(x => new SalesmanDailyPlansDto
            {
                Id = x.Id,
                UserName = x.User.UserName,
                OutletName = x.Outlet.Name,
                TargetSales = x.TargetSales,
                ActualSales = x.ActualSales ?? 0,
                CheckedIn = x.CheckedIn,
                CheckedOut = x.CheckedOut,
                Skipped = x.Skipped,
                Status = x.Status
            })
            .ToListAsync(cancellationToken);

        Debug.WriteLine($"FOUND {plans.Count} OUTLETS FOR {request.UserName}");
        return plans;
    }

}



