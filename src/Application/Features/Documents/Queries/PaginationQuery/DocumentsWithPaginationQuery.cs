// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.


using SFCTOFC.DailySalesPlanManagementApplication.Features.Documents.Caching;
using SFCTOFC.DailySalesPlanManagementApplication.Features.Documents.DTOs;
using SFCTOFC.DailySalesPlanManagementApplication.Features.Documents.Specifications;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Documents.Queries.PaginationQuery;

public class DocumentsWithPaginationQuery : AdvancedDocumentsFilter, ICacheableRequest<PaginatedData<DocumentDto>>
{
    public AdvancedDocumentsSpecification Specification => new(this);

    public string CacheKey => DocumentCacheKey.GetPaginationCacheKey($"{this}");
    public IEnumerable<string>? Tags => DocumentCacheKey.Tags;

    public override string ToString()
    {
        return
            $"CurrentUserId:{CurrentUser?.UserId},ListView:{ListView},Search:{Keyword},OrderBy:{OrderBy} {SortDirection},{PageNumber},{PageSize}";
    }
}

public class DocumentsQueryHandler : IRequestHandler<DocumentsWithPaginationQuery, PaginatedData<DocumentDto>>
{
    private readonly IMapper _mapper;
    private readonly IApplicationDbContextFactory _dbContextFactory;

    public DocumentsQueryHandler(
        IMapper mapper,
        IApplicationDbContextFactory dbContextFactory
    )
    {
        _mapper = mapper;
        _dbContextFactory = dbContextFactory;
    }

    public async Task<PaginatedData<DocumentDto>> Handle(DocumentsWithPaginationQuery request,
        CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var data = await db.Documents.OrderBy($"{request.OrderBy} {request.SortDirection}")
            .ProjectToPaginatedDataAsync<Document, DocumentDto>(request.Specification, request.PageNumber, request.PageSize, _mapper.ConfigurationProvider, cancellationToken);

        return data;
    }
}