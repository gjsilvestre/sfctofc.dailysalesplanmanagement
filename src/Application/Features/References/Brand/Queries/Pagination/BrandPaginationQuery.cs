using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DocumentFormat.OpenXml.Wordprocessing;
using FluentEmail.Core.Models;
using MailKit.Search;
using SFCTOFC.DailySalesPlanManagementApplication.Features.References.REFBrand.Caching;
using SFCTOFC.DailySalesPlanManagementApplication.Features.References.REFBrand.DTOs;
using SFCTOFC.DailySalesPlanManagementApplication.Features.References.REFBrand.Specifications;
using static Microsoft.Extensions.Logging.EventSource.LoggingEventSource;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.References.REFBrand.Queries.Pagination;
public class BrandWithPaginationQuery : BrandAdvancedFilter, ICacheableRequest<PaginatedData<BrandDto>>
{
    public BrandAdvancedSpecification Specification => new(this);
    public string CacheKey => BrandCacheKey.GetPaginationCacheKey($"{this}");

    public IEnumerable<string>? Tags => BrandCacheKey.Tags;

    // the currently logged in user
    public override string ToString()
    {
        return
            $"CurrentUser:{CurrentUser?.UserId},ListView:{ListView},Search:{Keyword},BrandName:{BrandName},BrandCode:{BrandCode},SortDirection:{SortDirection},OrderBy:{OrderBy},{PageNumber},{PageSize}";
    }
}

public class BrandWithPaginationQueryHandler :
    IRequestHandler<BrandWithPaginationQuery, PaginatedData<BrandDto>>
{
    private readonly IApplicationDbContextFactory _dbContextFactory;
    private readonly IMapper _mapper;
    public BrandWithPaginationQueryHandler(
        IApplicationDbContextFactory dbContextFactory,
        IMapper mapper
    )
    {
        _dbContextFactory = dbContextFactory;
        _mapper = mapper;
    }

    public async Task<PaginatedData<BrandDto>> Handle(BrandWithPaginationQuery request,
        CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var data = await db.Brands.OrderBy($"{request.OrderBy} {request.SortDirection}")
            .ProjectToPaginatedDataAsync<Brands, BrandDto>(request.Specification, request.PageNumber,
                 request.PageSize, _mapper.ConfigurationProvider, cancellationToken);
        return data;
    }
}