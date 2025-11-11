// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

using SFCTOFC.DailySalesPlanManagementApplication.Features.LoginAudits.Caching;
using SFCTOFC.DailySalesPlanManagementApplication.Features.LoginAudits.DTOs;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.LoginAudits.Queries.GetUserLoginRiskSummary;

public class GetUserLoginRiskSummaryQuery : ICacheableRequest<UserLoginRiskSummaryDto?>
{
    public required string UserId { get; set; }

    public string CacheKey => $"UserLoginRiskSummary_{UserId}";

    public IEnumerable<string>? Tags => LoginAuditCacheKey.Tags;
}

public class GetUserLoginRiskSummaryQueryHandler : IRequestHandler<GetUserLoginRiskSummaryQuery, UserLoginRiskSummaryDto?>
{
    private readonly IApplicationDbContextFactory _dbContextFactory;
    private readonly IMapper _mapper;

    public GetUserLoginRiskSummaryQueryHandler(
        IApplicationDbContextFactory dbContextFactory,
        IMapper mapper
    )
    {
        _dbContextFactory = dbContextFactory;
        _mapper = mapper;
    }

    public async Task<UserLoginRiskSummaryDto?> Handle(GetUserLoginRiskSummaryQuery request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var summary = await db.UserLoginRiskSummaries
            .Where(x => x.UserId == request.UserId)
            .ProjectTo<UserLoginRiskSummaryDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync(cancellationToken);
        return summary;
    }
} 