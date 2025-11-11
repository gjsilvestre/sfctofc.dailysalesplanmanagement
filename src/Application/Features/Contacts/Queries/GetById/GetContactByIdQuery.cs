
#nullable enable
#nullable disable warnings

using SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.DTOs;
using SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.Caching;
using SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.Specifications;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.Queries.GetById;

public class GetContactByIdQuery : ICacheableRequest<Result<ContactDto>>
{
   public required int Id { get; set; }
   public string CacheKey => ContactCacheKey.GetByIdCacheKey($"{Id}");
   public IEnumerable<string>? Tags => ContactCacheKey.Tags;
}

public class GetContactByIdQueryHandler :
     IRequestHandler<GetContactByIdQuery, Result<ContactDto>>
{
    private readonly IApplicationDbContextFactory _dbContextFactory;
    private readonly IMapper _mapper;
    public GetContactByIdQueryHandler(
        IApplicationDbContextFactory dbContextFactory,
        IMapper mapper
    )
    {
        _dbContextFactory = dbContextFactory;
        _mapper = mapper;
    }

    public async Task<Result<ContactDto>> Handle(GetContactByIdQuery request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var data = await db.Contacts.ApplySpecification(new ContactByIdSpecification(request.Id))
                                                .ProjectTo<ContactDto>(_mapper.ConfigurationProvider)
                                                .FirstAsync(cancellationToken) ?? throw new NotFoundException($"Contact with id: [{request.Id}] not found.");
        return await Result<ContactDto>.SuccessAsync(data);
    }
}
