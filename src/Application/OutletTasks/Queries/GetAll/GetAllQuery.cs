using SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.Caching;
using SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.DTOs;
using SFCTOFC.DailySalesPlanManagement.Application.DSPMOutletTasks.Caching;

public class GetAllOutletTasksQuery : IRequest<IEnumerable<OutletTasksDto>>
{
    public string CacheKey => OutletTasksCacheKey.GetAllCacheKey;
    public IEnumerable<string>? Tags => OutletTasksCacheKey.Tags;
}

public class GetOutletTasksQuery : ICacheableRequest<OutletTasksDto?>
{
    public required int Id { get; set; }

    public string CacheKey => OutletTasksCacheKey.GetOutletTasksByIdCacheKey(Id);
    public IEnumerable<string>? Tags => OutletTasksCacheKey.Tags;
}

public class GetAllOutletTasksQueryHandler :
    IRequestHandler<GetAllOutletTasksQuery, IEnumerable<OutletTasksDto>>,
    IRequestHandler<GetOutletTasksQuery, OutletTasksDto?>
{
    private readonly IMapper _mapper;
    private readonly IApplicationDbContextFactory _dbContextFactory;

    public GetAllOutletTasksQueryHandler(
        IMapper mapper,
        IApplicationDbContextFactory dbContextFactory
    )
    {
        _mapper = mapper;
        _dbContextFactory = dbContextFactory;
    }

    public async Task<IEnumerable<OutletTasksDto>> Handle(GetAllOutletTasksQuery request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var data = await db.OutletTasks
            .ProjectTo<OutletTasksDto>(_mapper.ConfigurationProvider)
            .ToListAsync(cancellationToken);
        return data;
    }

    public async Task<OutletTasksDto?> Handle(GetOutletTasksQuery request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var data = await db.OutletTasks.Where(x => x.Id == request.Id)
                       .ProjectTo<OutletTasksDto>(_mapper.ConfigurationProvider)
                       .FirstOrDefaultAsync(cancellationToken);
        return data;
    }
}