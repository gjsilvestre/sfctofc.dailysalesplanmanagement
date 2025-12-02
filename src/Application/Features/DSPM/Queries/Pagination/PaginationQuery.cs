
using DocumentFormat.OpenXml.Bibliography;
using SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.Caching;
using SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.DTOs;
using SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.Specifications;
using SFCTOFC.DailySalesPlanManagement.Application.Features.Identity.DTOs;

namespace SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.Queries.Pagination;

#region SalesmanTracker

public class PaginationQuerySalesmanTracker : AdvancedFilterSalesmanTracker, IRequest<PaginatedData<SalesmanTrackerDto>>
{
    public AdvancedSpecificationSalesmanTracker Specification => new(this);
    public string CacheKey => SalesmanTracketCacheKey.GetPaginationCacheKey($"{this}");
    public IEnumerable<string>? Tags => SalesmanTracketCacheKey.Tags;

    // the currently logged in user
    public override string ToString()
    {
        return
            $"CurrentUser:{CurrentUser?.UserId},ListView:{ListView},Search:{Keyword},Name:{Name},Date:{Date},SortDirection:{SortDirection},OrderBy:{OrderBy},{PageNumber},{PageSize}";
    }
}

public class PaginationQuerySalesmanTrackerHandler : IRequestHandler<PaginationQuerySalesmanTracker, PaginatedData<SalesmanTrackerDto>>
{
    private readonly IApplicationDbContextFactory _dbContextFactory;
    private readonly IMapper _mapper;
    public PaginationQuerySalesmanTrackerHandler(IApplicationDbContextFactory dbContextFactory, IMapper mapper)
    {
        _dbContextFactory = dbContextFactory;
        _mapper = mapper;
    }

    public async Task<PaginatedData<SalesmanTrackerDto>> Handle(PaginationQuerySalesmanTracker request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var query = from slm in db.SalesmanTracker.AsQueryable()
                    select new SalesmanTrackerDto
                    {
                        Id = slm.Id,
                        AspNetUserId = slm.AspNetUserId,
                        Name = slm.Name,
                        Date = slm.Date,
                        ActualSales = slm.ActualSales,
                        TargetSales = slm.TargetSales,
                        ActualStoreVisited = slm.ActualStoreVisited,
                        TargetStoreVisited = slm.TargetStoreVisited,
                        Skipped = 0
                    };

        // Apply sorting
        query = query.OrderBy($"{request.OrderBy} {request.SortDirection}");
        // Count total before applying pagination
        var totalCount = await query.CountAsync(cancellationToken);
        // Apply pagination
        var items = await query
            .Skip((request.PageNumber - 1) * request.PageSize)
            .Take(request.PageSize)
            .ToListAsync(cancellationToken);

        return new PaginatedData<SalesmanTrackerDto>(items, totalCount, request.PageNumber, request.PageSize);
    }
}

#endregion

#region PurchaseOrder

public class PaginationQueryPurchaseOrder : AdvancedFilterPurchaseOrder, IRequest<PaginatedData<PurchaseOrderDto>>
{
    public AdvancedSpecificationPurchaseOrder Specification => new(this);
    public string CacheKey => PurchaseOrderCacheKey.GetPaginationCacheKey($"{this}");
    public IEnumerable<string>? Tags => PurchaseOrderCacheKey.Tags;

    // the currently logged in user
    public override string ToString()
    {
        return
            $"CurrentUser:{CurrentUser?.UserId},ListView:{ListView},Search:{Keyword},PurchaseOrderNo:{PurchaseOrderNo},PurchaseOrderDate:{PurchaseOrderDate},SortDirection:{SortDirection},OrderBy:{OrderBy},{PageNumber},{PageSize}";
    }
}

public class PaginationQueryPurchaseOrderHandler : IRequestHandler<PaginationQueryPurchaseOrder, PaginatedData<PurchaseOrderDto>>
{
    private readonly IApplicationDbContextFactory _dbContextFactory;
    private readonly IMapper _mapper;
    public PaginationQueryPurchaseOrderHandler(IApplicationDbContextFactory dbContextFactory, IMapper mapper)
    {
        _dbContextFactory = dbContextFactory;
        _mapper = mapper;
    }

    public async Task<PaginatedData<PurchaseOrderDto>> Handle(PaginationQueryPurchaseOrder request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var query = from po in db.PurchaseOrder.AsQueryable()
                    join ot in db.Outlets on po.OutletId equals ot.Id
                    select new PurchaseOrderDto
                    {
                        Id = po.Id,
                        PurchaseOrderNo = po.PurchaseOrderNo,
                        PurchaseOrderDate = po.PurchaseOrderDate,
                        OutletId = po.OutletId,
                        OutletName = ot.Name,
                        OutletAddress = ot.Address, //string.Format("{0} {1}, {2}", ot.Address, ot.City, ot.Province),
                        OutletProvince = ot.Province,
                        OutletRegion = ot.Region,
                        VendorName = po.VendorName,
                        VendorAddress = po.VendorAddress,
                        DeliveryDate = po.DeliveryDate,
                        CancelDate = po.CancelDate,
                        Salesman = ot.Salesman,
                        Status = po.Status
                    };

        // Apply sorting
        query = query.OrderBy($"{request.OrderBy} {request.SortDirection}");
        // Count total before applying pagination
        var totalCount = await query.CountAsync(cancellationToken);
        // Apply pagination
        var items = await query
            .Skip((request.PageNumber - 1) * request.PageSize)
            .Take(request.PageSize)
            .ToListAsync(cancellationToken);

        return new PaginatedData<PurchaseOrderDto>(items, totalCount, request.PageNumber, request.PageSize);
    }
}


#endregion

#region SalesOrder



#endregion

#region Outlets

public class PaginationQueryOutlets : AdvancedFilterOutlet, IRequest<PaginatedData<OutletDto>>
{
    public AdvancedSpecificationOutlet Specification => new(this);
    public string CacheKey => OutletsCacheKey.GetPaginationCacheKey($"{this}");
    public IEnumerable<string>? Tags => OutletsCacheKey.Tags;
    // the currently logged in user
    public override string ToString()
    {
        return
            $"Search:{Keyword},SortDirection:{SortDirection},OrderBy:{OrderBy},{PageNumber},{PageSize}";
    }
}

public class PaginationQueryOutletHandler : IRequestHandler<PaginationQueryOutlets, PaginatedData<OutletDto>>
{
    private readonly IApplicationDbContextFactory _dbContextFactory;
    private readonly IMapper _mapper;
    public PaginationQueryOutletHandler(IApplicationDbContextFactory dbContextFactory, IMapper mapper)
    {
        _dbContextFactory = dbContextFactory;
        _mapper = mapper;
    }

    public async Task<PaginatedData<OutletDto>> Handle(PaginationQueryOutlets request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var query = from otl in db.Outlets.AsQueryable()
                    select new OutletDto
                    {
                        Id = otl.Id,
                        ExternalId = otl.ExternalId,
                        Name = otl.Name,
                        Address = otl.Address,
                        Barangay = otl.Barangay,
                        City = otl.City,
                        Province = otl.Province,
                        Region = otl.Region,   
                        Latitude = otl.Latitude,
                        Longitude = otl.Longitude,
                        Channel = otl.Channel,
                        Salesman = otl.Salesman,
                        Supervisor = otl.Supervisor,
                        BusinessDivision = otl.BusinessDivision,
                        Route = otl.Route,
                        CallSequence = otl.CallSequence,
                        Image = otl.Image
                    };

        // Apply sorting
        query = query.OrderBy($"{request.OrderBy} {request.SortDirection}");
        // Count total before applying pagination
        var totalCount = await query.CountAsync(cancellationToken);
        // Apply pagination
        var items = await query
            .Skip((request.PageNumber - 1) * request.PageSize)
            .Take(request.PageSize)
            .ToListAsync(cancellationToken);

        return new PaginatedData<OutletDto>(items, totalCount, request.PageNumber, request.PageSize);
    }
}

#endregion