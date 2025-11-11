
#nullable enable
#nullable disable warnings

using SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.Caching;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.Commands.Create;

public class CreateContactCommand: ICacheInvalidatorRequest<Result<int>>
{
      [Description("Id")]
      public int Id { get; set; }
          [Description("Name")]
    public string Name {get;set;} 
    [Description("Description")]
    public string? Description {get;set;} 
    [Description("Email")]
    public string? Email {get;set;} 
    [Description("Phone number")]
    public string? PhoneNumber {get;set;} 
    [Description("Country")]
    public string? Country {get;set;} 

      public string CacheKey => ContactCacheKey.GetAllCacheKey;
      public IEnumerable<string>? Tags => ContactCacheKey.Tags;
      private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<CreateContactCommand, Contact>(MemberList.None);
        }
    }
}
    
    public class CreateContactCommandHandler : IRequestHandler<CreateContactCommand, Result<int>>
    {
        private readonly IApplicationDbContextFactory _dbContextFactory;
        private readonly IMapper _mapper;
        public CreateContactCommandHandler(
            IApplicationDbContextFactory dbContextFactory,
            IMapper mapper
        )
        {
            _dbContextFactory = dbContextFactory;
            _mapper = mapper;
        }
        public async Task<Result<int>> Handle(CreateContactCommand request, CancellationToken cancellationToken)
        {
            await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
            var item = _mapper.Map<Contact>(request);
            item.AddDomainEvent(new ContactCreatedEvent(item));
            db.Contacts.Add(item);
            await db.SaveChangesAsync(cancellationToken);
            return await Result<int>.SuccessAsync(item.Id);
        }
    }

