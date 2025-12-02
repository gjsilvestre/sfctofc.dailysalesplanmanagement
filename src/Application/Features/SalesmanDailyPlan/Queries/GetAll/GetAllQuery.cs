using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SFCTOFC.DailySalesPlanManagement.Application.DSPMOutletTasks.Caching;
using SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.Caching;
using SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.DTOs;

namespace SFCTOFC.DailySalesPlanManagement.Application.Features.DSPMSalesmanDailyPlan.Queries.GetAllQuery;
public class GetAllSalesmanDailyPlanQuery : IRequest<IEnumerable<SalesmanDailyPlansDto>>
{
    public string CacheKey => SalesmanDailyPlanCacheKey.GetAllCacheKey;
    public IEnumerable<string>? Tags => SalesmanDailyPlanCacheKey.Tags;
}

public class GetSalesmanDailyPlanQuery : ICacheableRequest<SalesmanDailyPlansDto?>
{
    public required int Id { get; set; }

    public string CacheKey => SalesmanDailyPlanCacheKey.GetSalesmanDailyPlanByIdCacheKey(Id);
    public IEnumerable<string>? Tags => SalesmanDailyPlanCacheKey.Tags;
}

public class GetAllSalesmanDailyPlanQueryHandler :
    IRequestHandler<GetAllSalesmanDailyPlanQuery, IEnumerable<SalesmanDailyPlansDto>>,
    IRequestHandler<GetSalesmanDailyPlanQuery, SalesmanDailyPlansDto?>
{
    private readonly IMapper _mapper;
    private readonly IApplicationDbContextFactory _dbContextFactory;

    public GetAllSalesmanDailyPlanQueryHandler(
        IMapper mapper,
        IApplicationDbContextFactory dbContextFactory
    )
    {
        _mapper = mapper;
        _dbContextFactory = dbContextFactory;
    }

    public async Task<IEnumerable<SalesmanDailyPlansDto>> Handle(GetAllSalesmanDailyPlanQuery request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var data = await db.SalesmanDailyPlans
            .ProjectTo<SalesmanDailyPlansDto>(_mapper.ConfigurationProvider)
            .ToListAsync(cancellationToken);
        return data;
    }

    public async Task<SalesmanDailyPlansDto?> Handle(GetSalesmanDailyPlanQuery request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var data = await db.SalesmanDailyPlans.Where(x => x.Id == request.Id)
                       .ProjectTo<SalesmanDailyPlansDto>(_mapper.ConfigurationProvider)
                       .FirstOrDefaultAsync(cancellationToken);
        return data;
    }
}