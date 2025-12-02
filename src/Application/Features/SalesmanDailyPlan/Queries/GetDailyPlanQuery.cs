using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.DTOs;

namespace SFCTOFC.DailySalesPlanManagement.Application.Features.DSPMSalesmanDailyPlan.Queries;


public class GetDailyPlansQuery : IRequest<IEnumerable<SalesmanDailyPlansDto>>
{
}

public class GetDailyPlansQueryHandler : IRequestHandler<GetDailyPlansQuery, IEnumerable<SalesmanDailyPlansDto>>
{
    private readonly IMapper _mapper;
    private readonly IApplicationDbContextFactory _dbContextFactory;

    public GetDailyPlansQueryHandler(IMapper mapper, IApplicationDbContextFactory dbContextFactory)
    {
        _mapper = mapper;
        _dbContextFactory = dbContextFactory;
    }

    public async Task<IEnumerable<SalesmanDailyPlansDto>> Handle(GetDailyPlansQuery request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);

        var data = await db.SalesmanDailyPlans
            .Include(x => x.Outlet)
            .Include(x => x.User)
            .Select(x => new SalesmanDailyPlansDto
            {
                Id = x.Id,
                UserId = x.UserId,
                UserName = x.User != null ? x.User.UserName : string.Empty,
                OutletId = x.OutletId,
                OutletName = x.Outlet != null ? x.Outlet.Name : string.Empty,
                PlanDate = x.PlanDate
            })
            .ToListAsync(cancellationToken);

        return data;
    }

}

