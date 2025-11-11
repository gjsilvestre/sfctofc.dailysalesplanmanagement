
#nullable enable
#nullable disable warnings

using SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.DTOs;
using SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.Caching;
using SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.Specifications;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.Queries.Pagination;

public class ContactsWithPaginationQuery : ContactAdvancedFilter, ICacheableRequest<PaginatedData<ContactDto>>
{
    public override string ToString()
    {
        return $"Listview:{ListView}:{CurrentUser?.UserId}, Search:{Keyword}, {OrderBy}, {SortDirection}, {PageNumber}, {PageSize}";
    }
    public string CacheKey => ContactCacheKey.GetPaginationCacheKey($"{this}");
    public IEnumerable<string>? Tags => ContactCacheKey.Tags;
    public ContactAdvancedSpecification Specification => new ContactAdvancedSpecification(this);
}
    
public class ContactsWithPaginationQueryHandler :
         IRequestHandler<ContactsWithPaginationQuery, PaginatedData<ContactDto>>
{
    private readonly IApplicationDbContextFactory _dbContextFactory;
    private readonly IMapper _mapper;
    public ContactsWithPaginationQueryHandler(
        IApplicationDbContextFactory dbContextFactory,
        IMapper mapper
    )
    {
        _dbContextFactory = dbContextFactory;
        _mapper = mapper;
    }

    public async Task<PaginatedData<ContactDto>> Handle(ContactsWithPaginationQuery request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var data = await db.Contacts.OrderBy($"{request.OrderBy} {request.SortDirection}")
            .ProjectToPaginatedDataAsync<Contact, ContactDto>(request.Specification, request.PageNumber, request.PageSize, _mapper.ConfigurationProvider, cancellationToken);
        return data;
    }
}