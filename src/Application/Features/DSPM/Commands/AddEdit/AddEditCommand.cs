

using DocumentFormat.OpenXml.Office2010.Excel;
using SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.Caching;
using SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.DTOs;
using SFCTOFC.DailySalesPlanManagement.Application.Features.Products.Commands.AddEdit;

namespace SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.Commands.AddEdit;
public class AddEditCommandPurchaseOrder : ICacheInvalidatorRequest<Result<int>>
{
    #region PARAMETERS
    public int Id { get; set; }
    public string? PurchaseOrderNo { get; set; }
    public DateTime? PurchaseOrderDate { get; set; }
    public int? OutletId { get; set; }
    public string? OutletName { get; set; }
    public string? OutletAddress { get; set; }
    public string? OutletProvince { get; set; }
    public string? OutletRegion { get; set; }
    public string? VendorName { get; set; }
    public string? VendorAddress { get; set; }
    public DateTime? DeliveryDate { get; set; }
    public DateTime? CancelDate { get; set; }
    public string? Salesman { get; set; }
    public string? Status { get; set; }

    #endregion

    public string CacheKey => PurchaseOrderCacheKey.GetPurchaseOrderByIdCacheKey(Id);
    public IEnumerable<string>? Tags => PurchaseOrderCacheKey.Tags;

    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<PurchaseOrderDto, AddEditCommandPurchaseOrder>().ReverseMap();
            CreateMap<AddEditCommandPurchaseOrder, PurchaseOrder>(MemberList.None)
                .ForMember(dest => dest.CreatedBy, opt => opt.Ignore());
        }
    }
}

public class AddEditCommandPurchaseOrderDetails : ICacheInvalidatorRequest<Result<int>>
{
    #region PARAMETERS
    public int Id { get; set; }
    public int PurchaseOrderId { get; set; }
    public string? SKUNo { get; set; }
    public string? UPC { get; set; }
    public string? Description { get; set; }
    public int? Quantity { get; set; }
    public string? UOM { get; set; }
    public decimal? BuyCost { get; set; }
    public decimal? Amount { get; set; }

    #endregion

    public string CacheKey => PurchaseOrderDetailsCacheKey.GetPurchaseOrderDetailsByIdCacheKey(Id);
    public IEnumerable<string>? Tags => PurchaseOrderDetailsCacheKey.Tags;
    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<PurchaseOrderDetailsDto, AddEditCommandPurchaseOrderDetails>().ReverseMap();
            CreateMap<AddEditCommandPurchaseOrderDetails, PurchaseOrderDetails>(MemberList.None)
                .ForMember(dest => dest.CreatedBy, opt => opt.Ignore());
        }
    }
}

#region OUTLET
public class AddEditOutletCommand : ICacheInvalidatorRequest<Result<int>>
{
    #region PARAMETERS

    public int Id { get; set; }
    public string? ExternalId { get; set; }
    public string? Name { get; set; }
    public string? Address { get; set; }
    public string? Barangay { get; set; }
    public string? City { get; set; }
    public string? Province { get; set; }
    public string? Region { get; set; }
    public decimal? Latitude { get; set; }
    public decimal? Longitude { get; set; }
    public string? Channel { get; set; }
    public string? Salesman { get; set; }
    public string? Supervisor { get; set; }
    public string? BusinessDivision { get; set; }
    public string? Route { get; set; }
    public int? CallSequence { get; set; }
    public string? Image { get; set; }

    #endregion

    public string CacheKey => OutletsCacheKey.GetOutletByIdCacheKey(Id);
    public IEnumerable<string>? Tags => OutletsCacheKey.Tags;

    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<OutletDto, AddEditOutletCommand>().ReverseMap();
            CreateMap<AddEditOutletCommand, Outlets>(MemberList.None)
                .ForMember(dest => dest.CreatedBy, opt => opt.Ignore());
        }
    }
}

public class AddEditOutletCommandHandler : IRequestHandler<AddEditOutletCommand, Result<int>>
{
    private readonly IApplicationDbContextFactory _dbContextFactory;
    private readonly IMapper _mapper;

    public AddEditOutletCommandHandler(
        IApplicationDbContextFactory dbContextFactory,
        IMapper mapper
    )
    {
        _dbContextFactory = dbContextFactory;
        _mapper = mapper;
    }

    public async Task<Result<int>> Handle(AddEditOutletCommand request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        if (request.Id > 0)
        {
            var item = await db.Outlets.SingleOrDefaultAsync(x => x.Id == request.Id, cancellationToken);
            if (item == null) return await Result<int>.FailureAsync($"Record with id: [{request.Id}] not found.");
            item = _mapper.Map(request, item);
            await db.SaveChangesAsync(cancellationToken);
            return await Result<int>.SuccessAsync(item.Id);
        }
        else
        {
            var item = _mapper.Map<Outlets>(request);
            db.Outlets.Add(item);
            await db.SaveChangesAsync(cancellationToken);
            return await Result<int>.SuccessAsync(item.Id);
        }
    }
}

#endregion

#region MOBILE APP: SUBMIT ORDERS

public class SubmitPurchaseOrderCommand : ICacheInvalidatorRequest<Result<int>>
{
    #region PARAMETERS
    public PurchaseOrderDto PurchaseOrder { get; set; }
    #endregion

    public IEnumerable<string>? Tags => PurchaseOrderCacheKey.Tags;

    public SubmitPurchaseOrderCommand(PurchaseOrderDto purchaseOrder)
    {
        PurchaseOrder = purchaseOrder;
    }

    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<PurchaseOrderDto, SubmitPurchaseOrderCommand>().ReverseMap();
            CreateMap<SubmitPurchaseOrderCommand, PurchaseOrder>(MemberList.None)
                .ForMember(dest => dest.CreatedBy, opt => opt.Ignore());
            CreateMap<PurchaseOrderDto, PurchaseOrder>()
                .ForMember(dest => dest.CreatedByUser, opt => opt.Ignore())
                .ForMember(dest => dest.LastModifiedByUser, opt => opt.Ignore());
        }
    }
}

public class SubmitPurchaseOrderCommandHandler : IRequestHandler<SubmitPurchaseOrderCommand, Result<int>>
{
    private readonly IApplicationDbContextFactory _dbContextFactory;
    private readonly IMapper _mapper;

    public SubmitPurchaseOrderCommandHandler(
        IApplicationDbContextFactory dbContextFactory,
        IMapper mapper
    )
    {
        _dbContextFactory = dbContextFactory;
        _mapper = mapper;
    }

    public async Task<Result<int>> Handle(SubmitPurchaseOrderCommand request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);

        if (request.PurchaseOrder.Id > 0)
        {
            var item = await db.PurchaseOrder.SingleOrDefaultAsync(x => x.Id == request.PurchaseOrder.Id, cancellationToken);
            if (item == null) return await Result<int>.FailureAsync($"Record with id: [{request.PurchaseOrder.Id}] not found.");
            item = _mapper.Map(request, item);
            await db.SaveChangesAsync(cancellationToken);
            return await Result<int>.SuccessAsync(item.Id);
        }
        else
        {
            var customer = db.Outlets.Where(x => x.Name == request.PurchaseOrder.OutletName).FirstOrDefault();
            var poCount = db.PurchaseOrder.Count() + 1;
            var poNo = $"RMCPO-{poCount:000000}";

            var item = _mapper.Map<PurchaseOrder>(request.PurchaseOrder);
            item.PurchaseOrderNo = poNo;
            item.OutletId = customer != null ? customer.Id : 0;
            db.PurchaseOrder.Add(item);


            foreach (var detail in request.PurchaseOrder.Details!)
            {
                var poDetails = new PurchaseOrderDetails
                {
                    PurchaseOrderId = item.Id,
                    SKUNo = detail.SKUNo,
                    UPC = detail.UPC,
                    Description = detail.Description,
                    Quantity = detail.Quantity,
                    UOM = detail.UOM,
                    BuyCost = detail.BuyCost,
                    Amount = detail.Amount
                };

                db.PurchaseOrderDetails.Add(poDetails);
            }

            await db.SaveChangesAsync(cancellationToken);
            return await Result<int>.SuccessAsync(item.Id);
        }
    }
}

#endregion