
#nullable enable
#nullable disable warnings

using SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.DTOs;
using SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.Caching;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.Queries.GetAll;

public class GetAllContactsQuery : ICacheableRequest<IEnumerable<ContactDto>>
{
   public string CacheKey => ContactCacheKey.GetAllCacheKey;
   public IEnumerable<string>? Tags => ContactCacheKey.Tags;
}

public class GetAllContactsQueryHandler :
     IRequestHandler<GetAllContactsQuery, IEnumerable<ContactDto>>
{
    private readonly IApplicationDbContextFactory _dbContextFactory;
    private readonly IMapper _mapper;
    public GetAllContactsQueryHandler(
        IApplicationDbContextFactory dbContextFactory,
        IMapper mapper
    )
    {
        _dbContextFactory = dbContextFactory;
        _mapper = mapper;
    }

    public async Task<IEnumerable<ContactDto>> Handle(GetAllContactsQuery request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var data = await db.Contacts
            .ProjectTo<ContactDto>(_mapper.ConfigurationProvider)
            .ToListAsync(cancellationToken);
        return data;
    }
}


