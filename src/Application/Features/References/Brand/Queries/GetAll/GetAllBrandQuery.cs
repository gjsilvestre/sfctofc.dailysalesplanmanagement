using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SFCTOFC.DailySalesPlanManagementApplication.Features.References.REFBrand.Caching;
using SFCTOFC.DailySalesPlanManagementApplication.Features.References.REFBrand.DTOs;


namespace SFCTOFC.DailySalesPlanManagementApplication.Features.References.REFBrand.Queries.GetAll;
public class GetAllBrandQuery : ICacheableRequest<IEnumerable<BrandDto>>
{
    public string CacheKey => BrandCacheKey.GetAllCacheKey;
public IEnumerable<string>? Tags => BrandCacheKey.Tags;

}

public class GetBrandQuery : ICacheableRequest<BrandDto?>
{
    public required int Id { get; set; }

    public string CacheKey => BrandCacheKey.GetBrandByIdCacheKey(Id);
    public IEnumerable<string>? Tags => BrandCacheKey.Tags;
}

public class GetAllBrandQueryHandler :
    IRequestHandler<GetAllBrandQuery, IEnumerable<BrandDto>>,
    IRequestHandler<GetBrandQuery, BrandDto?>
{
    private readonly IMapper _mapper;
    private readonly IApplicationDbContextFactory _dbContextFactory;

    public GetAllBrandQueryHandler(
        IMapper mapper,
        IApplicationDbContextFactory dbContextFactory
    )
    {
        _mapper = mapper;
        _dbContextFactory = dbContextFactory;
    }

    //below line 24 connected fon sa getallwoquery
    public async Task<IEnumerable<BrandDto>> Handle(GetAllBrandQuery request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var data = await db.Brands
            .ProjectTo<BrandDto>(_mapper.ConfigurationProvider)
            .ToListAsync(cancellationToken);
        return data;
    }
    //below line 25 naman sa getwoquery coonnected
    public async Task<BrandDto?> Handle(GetBrandQuery request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var data = await db.Brands.Where(x => x.Id == request.Id)
                       .ProjectTo<BrandDto>(_mapper.ConfigurationProvider)
                       .FirstOrDefaultAsync(cancellationToken);
        return data;
    }
}