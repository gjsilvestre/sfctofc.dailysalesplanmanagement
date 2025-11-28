
using SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.DTOs;

namespace SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.Queries.Export;
public class ExportPurchaseOrderQuery : IRequest<Result<byte[]>>
{
    public DateTime? PurchaseOrderDate { get; set; }
    public string? ExportType { get; set; }
}

public class ExportPurchaseOrderQueryHandler : IRequestHandler<ExportPurchaseOrderQuery, Result<byte[]>>
{
    private readonly IApplicationDbContextFactory _dbContextFactory;
    private readonly IMapper _mapper;
    private readonly IExcelService _excelService;
    private readonly IStringLocalizer<ExportPurchaseOrderQueryHandler> _localizer;
    private readonly IPDFService _pdfService;

    public ExportPurchaseOrderQueryHandler(
        IApplicationDbContextFactory dbContextFactory,
        IMapper mapper,
        IExcelService excelService,
        IPDFService pdfService,
        IStringLocalizer<ExportPurchaseOrderQueryHandler> localizer
    )
    {
        _dbContextFactory = dbContextFactory;
        _mapper = mapper;
        _excelService = excelService;
        _pdfService = pdfService;
        _localizer = localizer;
    }

#nullable disable warnings
    public async Task<Result<byte[]>> Handle(ExportPurchaseOrderQuery request, CancellationToken cancellationToken)
    {
        await using var db = await _dbContextFactory.CreateAsync(cancellationToken);
        var query = from po in db.PurchaseOrder
                    join pd in db.PurchaseOrderDetails on po.Id equals pd.PurchaseOrderId
                    join ot in db.Outlets on po.OutletId equals ot.Id
                    where po.PurchaseOrderDate == request.PurchaseOrderDate
                    select new PurchaseOrderPrintingDto
                    {
                        PurchaseOrderNo = po.PurchaseOrderNo,
                        PurchaseOrderDate = po.PurchaseOrderDate,
                        OutletName = ot.Name,
                        OutletAddress = ot.Address,
                        OutletProvince = ot.Province,
                        OutletRegion = ot.Region,
                        DeliveryDate = po.DeliveryDate,
                        CancelDate = po.CancelDate,
                        SKUNo = pd.SKUNo,
                        Description = pd.Description,
                        Quantity = pd.Quantity,
                        UOM = pd.UOM,
                        BuyCost = pd.BuyCost,
                        Amount = pd.Amount
                    };
        
        var data = await query.ToListAsync(cancellationToken);

        byte[] result;
        Dictionary<string, Func<PurchaseOrderPrintingDto, object?>> mappers;
        switch (request.ExportType)
        {
            case "PDF":
                mappers = new Dictionary<string, Func<PurchaseOrderPrintingDto, object?>>
                {
                    { _localizer["PO No"], x => x.PurchaseOrderNo },
                    { _localizer["PO Date"], x => x.PurchaseOrderDate?.ToString("d") },
                    { _localizer["Name"], x => x.OutletName },
                    { _localizer["Address"], x => x.OutletAddress },
                    { _localizer["Province"], x => x.OutletProvince },
                    { _localizer["Region"], x => x.OutletRegion },
                    { _localizer["Delivery Date"], x => x.DeliveryDate?.ToString("d") },
                    { _localizer["Cancel Date"], x => x.CancelDate?.ToString("d") },
                    { _localizer["SKU No"], x => x.SKUNo },
                    { _localizer["Description"], x => x.Description },
                    { _localizer["Quantity"], x => x.Quantity?.ToString("N0") },
                    { _localizer["UOM"], x => x.UOM },
                    { _localizer["Buy Cost"], x => x.BuyCost?.ToString("N2") },
                    { _localizer["Amount"], x => x.Amount?.ToString("N2") }
                };

                result = await _pdfService.ExportAsync(data, mappers, _localizer["Purchase Order"], PdfOrientation.Landscape);
                break;
            default:
                mappers = new Dictionary<string, Func<PurchaseOrderPrintingDto, object?>>
                {
                    { _localizer["PO No"], x => x.PurchaseOrderNo },
                    { _localizer["PO Date"], x => x.PurchaseOrderDate?.ToString("d") },
                    { _localizer["Name"], x => x.OutletName },
                    { _localizer["Address"], x => x.OutletAddress },
                    { _localizer["Province"], x => x.OutletProvince },
                    { _localizer["Region"], x => x.OutletRegion },
                    { _localizer["Delivery Date"], x => x.DeliveryDate?.ToString("d") },
                    { _localizer["Cancel Date"], x => x.CancelDate?.ToString("d") },
                    { _localizer["SKU No"], x => x.SKUNo },
                    { _localizer["Description"], x => x.Description },
                    { _localizer["Quantity"], x => x.Quantity?.ToString("N0") },
                    { _localizer["UOM"], x => x.UOM },
                    { _localizer["Buy Cost"], x => x.BuyCost?.ToString("N2") },
                    { _localizer["Amount"], x => x.Amount?.ToString("N2") }
                };

                result = await _pdfService.ExportAsync(data, mappers, _localizer["Purchase Order"], PdfOrientation.Landscape);
                break;
        }

        return await Result<byte[]>.SuccessAsync(result);
    }
}
