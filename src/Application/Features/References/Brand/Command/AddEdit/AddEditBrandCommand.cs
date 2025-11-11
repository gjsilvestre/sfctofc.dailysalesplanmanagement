using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SFCTOFC.DailySalesPlanManagementApplication.Features.References.REFBrand.Caching;
using SFCTOFC.DailySalesPlanManagementApplication.Features.References.REFBrand.DTOs;


namespace SFCTOFC.DailySalesPlanManagementApplication.Features.References.Brand.Command.AddEdit;
public class AddEditBrandCommand : ICacheInvalidatorRequest<Result<int>>
{
    public int Id { get; set; }
    public string? BrandCode { get; set; }
    public string? BrandName { get; set; }
    public string CacheKey => BrandCacheKey.GetAllCacheKey;
    public IEnumerable<string>? Tags => BrandCacheKey.Tags;

    private class Mapping : Profile
    {
        public Mapping()
        {
            //Whenever you have namespace and class with the same name, either:
            //Rename the folder/namespace (Features.WorkOrders instead of Features.WorkOrder), or
            //Always fully-qualify the entity with Domain.Entities.WorkOrder.
            CreateMap<BrandDto, AddEditBrandCommand>(MemberList.None);
            CreateMap<AddEditBrandCommand, Domain.Entities.Brands>(MemberList.None);
        }
    }
}

public class AddEditBrandCommandHandler : IRequestHandler<AddEditBrandCommand, Result<int>>
{
    private readonly IApplicationDbContextFactory _dbContextFactory;
    private readonly IMapper _mapper;

    public AddEditBrandCommandHandler(
        IApplicationDbContextFactory dbContextFactory,
        IMapper mapper
    )
    {
        _dbContextFactory = dbContextFactory;
        _mapper = mapper;
    }

    public async Task<Result<int>> Handle(AddEditBrandCommand request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        if (request.Id > 0)
        {
            var item = await db.Brands.SingleOrDefaultAsync(x => x.Id == request.Id, cancellationToken);
            if (item == null) return await Result<int>.FailureAsync($"Id: [{request.Id}] not found.");
            item = _mapper.Map(request, item);
            await db.SaveChangesAsync(cancellationToken);
            return await Result<int>.SuccessAsync(item.Id);
        }
        else
        {
           

            var item = _mapper.Map<Domain.Entities.Brands>(request);
   

            db.Brands.Add(item);
            await db.SaveChangesAsync(cancellationToken);

            return await Result<int>.SuccessAsync(item.Id);
        }

    }
}