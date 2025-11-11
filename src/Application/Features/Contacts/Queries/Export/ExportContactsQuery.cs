
#nullable enable
#nullable disable warnings

using SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.DTOs;
using SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.Caching;
using SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.Specifications;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Contacts.Queries.Export;

public class ExportContactsQuery : ContactAdvancedFilter, ICacheableRequest<Result<byte[]>>
{
      public ContactAdvancedSpecification Specification => new ContactAdvancedSpecification(this);
      public IEnumerable<string>? Tags => ContactCacheKey.Tags;
    public override string ToString()
    {
        return $"Listview:{ListView}:{CurrentUser?.UserId}, Search:{Keyword}, {OrderBy}, {SortDirection}";
    }
    public string CacheKey => ContactCacheKey.GetExportCacheKey($"{this}");
}
    
public class ExportContactsQueryHandler :
         IRequestHandler<ExportContactsQuery, Result<byte[]>>
{
        private readonly IApplicationDbContextFactory _dbContextFactory;
        private readonly IMapper _mapper;
        private readonly IExcelService _excelService;
        private readonly IStringLocalizer<ExportContactsQueryHandler> _localizer;
        private readonly ContactDto _dto = new();
        public ExportContactsQueryHandler(
            IApplicationDbContextFactory dbContextFactory,
            IMapper mapper,
            IExcelService excelService,
            IStringLocalizer<ExportContactsQueryHandler> localizer
            )
        {
            _dbContextFactory = dbContextFactory;
            _mapper = mapper;
            _excelService = excelService;
            _localizer = localizer;
        }
        #nullable disable warnings
        public async Task<Result<byte[]>> Handle(ExportContactsQuery request, CancellationToken cancellationToken)
        {
            await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
            var data = await db.Contacts.ApplySpecification(request.Specification)
                       .OrderBy($"{request.OrderBy} {request.SortDirection}")
                       .ProjectTo<ContactDto>(_mapper.ConfigurationProvider)
                       .AsNoTracking()
                       .ToListAsync(cancellationToken);
            var result = await _excelService.ExportAsync(data,
                new Dictionary<string, Func<ContactDto, object?>>()
                {
                                     {_localizer[_dto.GetMemberDescription(x=>x.Name)],item => item.Name}, 
                 {_localizer[_dto.GetMemberDescription(x=>x.Description)],item => item.Description}, 
                 {_localizer[_dto.GetMemberDescription(x=>x.Email)],item => item.Email}, 
                 {_localizer[_dto.GetMemberDescription(x=>x.PhoneNumber)],item => item.PhoneNumber}, 
                 {_localizer[_dto.GetMemberDescription(x=>x.Country)],item => item.Country}, 

                }
                , _localizer[_dto.GetClassDescription()]);
            return await Result<byte[]>.SuccessAsync(result);
        }
}
