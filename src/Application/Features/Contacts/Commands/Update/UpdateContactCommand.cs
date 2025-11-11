
#nullable enable
#nullable disable warnings

using SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.DTOs;
using SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.Caching;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.Commands.Update;

public class UpdateContactCommand: ICacheInvalidatorRequest<Result<int>>
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
            CreateMap<UpdateContactCommand, Contact>(MemberList.None);
            CreateMap<ContactDto,UpdateContactCommand>(MemberList.None);
        }
    }

}

public class UpdateContactCommandHandler : IRequestHandler<UpdateContactCommand, Result<int>>
{
    private readonly IApplicationDbContextFactory _dbContextFactory;
    private readonly IMapper _mapper;
    public UpdateContactCommandHandler(
        IApplicationDbContextFactory dbContextFactory,
        IMapper mapper
    )
    {
        _dbContextFactory = dbContextFactory;
        _mapper = mapper;
    }
    public async Task<Result<int>> Handle(UpdateContactCommand request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var item = await db.Contacts.FindAsync(request.Id, cancellationToken);
        if (item == null) return await Result<int>.FailureAsync("Contact not found");
        _mapper.Map(request, item);
        await db.SaveChangesAsync(cancellationToken);
        return await Result<int>.SuccessAsync(item.Id);
    }
}

