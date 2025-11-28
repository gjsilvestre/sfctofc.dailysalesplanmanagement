
using SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.Caching;
using SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.DTOs;

namespace SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.Queries.GetAll;

#region OUTLETS
public class GetAllOutletsQuery : IRequest<IEnumerable<OutletDto>>
{
    public string CacheKey => OutletsCacheKey.GetAllCacheKey;
    public IEnumerable<string>? Tags => OutletsCacheKey.Tags;
}

public class GetOutletsQuery : ICacheableRequest<OutletDto?>
{
    public required int Id { get; set; }

    public string CacheKey => OutletsCacheKey.GetOutletByIdCacheKey(Id);
    public IEnumerable<string>? Tags => OutletsCacheKey.Tags;
}

public class GetAllOutletsQueryHandler :
    IRequestHandler<GetAllOutletsQuery, IEnumerable<OutletDto>>,
    IRequestHandler<GetOutletsQuery, OutletDto?>
{
    private readonly IMapper _mapper;
    private readonly IApplicationDbContextFactory _dbContextFactory;

    public GetAllOutletsQueryHandler(
        IMapper mapper,
        IApplicationDbContextFactory dbContextFactory
    )
    {
        _mapper = mapper;
        _dbContextFactory = dbContextFactory;
    }

    public async Task<IEnumerable<OutletDto>> Handle(GetAllOutletsQuery request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var data = await db.Outlets
            .ProjectTo<OutletDto>(_mapper.ConfigurationProvider)
            .ToListAsync(cancellationToken);
        return data;
    }

    public async Task<OutletDto?> Handle(GetOutletsQuery request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var data = await db.Outlets.Where(x => x.Id == request.Id)
                       .ProjectTo<OutletDto>(_mapper.ConfigurationProvider)
                       .FirstOrDefaultAsync(cancellationToken);
        return data;
    }
}

#endregion

#region PURCHASE ORDER
public class GetAllPurchaseOrderDetailsQuery : IRequest<IEnumerable<PurchaseOrderDetailsDto>>
{
    public int PurchaseOrderId { get; set; }
    public string CacheKey => PurchaseOrderDetailsCacheKey.GetAllCacheKey;
    public IEnumerable<string>? Tags => PurchaseOrderDetailsCacheKey.Tags;
}
public class GetPurchaseOrderDetailsQuery : ICacheableRequest<PurchaseOrderDetailsDto?>
{
    public required int Id { get; set; }
    public string CacheKey => PurchaseOrderDetailsCacheKey.GetPurchaseOrderDetailsByIdCacheKey(Id);
    public IEnumerable<string>? Tags => PurchaseOrderDetailsCacheKey.Tags;
}

public class GetAllPurchaseOrderDetailsQueryHandler :
    IRequestHandler<GetAllPurchaseOrderDetailsQuery, IEnumerable<PurchaseOrderDetailsDto>>,
    IRequestHandler<GetPurchaseOrderDetailsQuery, PurchaseOrderDetailsDto?>
{
    private readonly IMapper _mapper;
    private readonly IApplicationDbContextFactory _dbContextFactory;

    public GetAllPurchaseOrderDetailsQueryHandler(
        IMapper mapper,
        IApplicationDbContextFactory dbContextFactory
    )
    {
        _mapper = mapper;
        _dbContextFactory = dbContextFactory;
    }

    public async Task<IEnumerable<PurchaseOrderDetailsDto>> Handle(GetAllPurchaseOrderDetailsQuery request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var data = await db.PurchaseOrderDetails.Where(x => x.PurchaseOrderId == request.PurchaseOrderId)
            .ProjectTo<PurchaseOrderDetailsDto>(_mapper.ConfigurationProvider)
            .ToListAsync(cancellationToken);
        return data;
    }

    public async Task<PurchaseOrderDetailsDto?> Handle(GetPurchaseOrderDetailsQuery request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var data = await db.PurchaseOrderDetails.Where(x => x.Id == request.Id)
                       .ProjectTo<PurchaseOrderDetailsDto>(_mapper.ConfigurationProvider)
                       .FirstOrDefaultAsync(cancellationToken);
        return data;
    }
}

#endregion
