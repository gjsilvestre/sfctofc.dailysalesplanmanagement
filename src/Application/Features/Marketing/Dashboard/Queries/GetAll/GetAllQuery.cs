
using System.Collections;
using SFCTOFC.DailySalesPlanManagementApplication.Features.Marketing.MRKDashboard.Caching;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Marketing.MRKDashboard.Queries.GetAll;

public class GetSPDashboardQuery : IRequest<Result<DataTable>>
{
    public DateTime? FromDate { get; set; }
    public DateTime? ToDate { get; set; }
    public string? Distributor { get; set; }
    public string? Region { get; set; }
    public string? StoredProcedure { get; set; }
}

public class GetSPDashboardQueryHandler : IRequestHandler<GetSPDashboardQuery, Result<DataTable>>
{
    private readonly IStringLocalizer<GetSPDashboardQueryHandler> _localizer;
    private readonly IDatabaseService _databaseService;

    public GetSPDashboardQueryHandler(
        IStringLocalizer<GetSPDashboardQueryHandler> localizer,
        IDatabaseService databaseService
    )
    {
        _localizer = localizer;
        _databaseService = databaseService;
    }

    public async Task<Result<DataTable>> Handle(GetSPDashboardQuery request, CancellationToken cancellationToken)
    {
        try
        {
            DataTable dtResult = new DataTable();
            DictionaryEntry[] paramInputs = new DictionaryEntry[]
            {
                new DictionaryEntry("@start_date", request.FromDate),
                new DictionaryEntry("@end_date", request.ToDate),
                new DictionaryEntry("@distributor", request.Distributor),
                new DictionaryEntry("@region", request.Region)
            };

            dtResult = await _databaseService.ExecuteStoredProcedureAsync(request.StoredProcedure, paramInputs);

            return await Result<DataTable>.SuccessAsync(dtResult);
        }
        catch (Exception)
        {
            throw;
        }
    }
}

public class GetSPDashboardResult : IRequest<Result<DataTable>>
{
    public string? mode { get; set; }
    public IEnumerable<string>? Tags => DashboardFilterCacheKey.Tags;
}

public class GetSPDashboardResultHandler : IRequestHandler<GetSPDashboardResult, Result<DataTable>>
{
    private readonly IStringLocalizer<GetSPDashboardResultHandler> _localizer;
    private readonly IDatabaseService _databaseService;

    public GetSPDashboardResultHandler(
        IStringLocalizer<GetSPDashboardResultHandler> localizer,
        IDatabaseService databaseService
    )
    {
        _localizer = localizer;
        _databaseService = databaseService;
    }

    public async Task<Result<DataTable>> Handle(GetSPDashboardResult request, CancellationToken cancellationToken)
    {
        try
        {
            DataTable dtResult = new DataTable();
            DictionaryEntry[] paramInputs = new DictionaryEntry[]
            {
                new DictionaryEntry("@mode", request.mode)
            };

            dtResult = await _databaseService.ExecuteStoredProcedureAsync("SP_SalesToTradeDashboard", paramInputs);

            return await Result<DataTable>.SuccessAsync(dtResult);
        }
        catch (Exception)
        {
            throw;
        }
    }
}

public class GetQueryResult : IRequest<List<string>>
{
    public string? queryString { get; set; }
    public IEnumerable<string>? Tags => DashboardFilterCacheKey.Tags;
}

public class GetQueryResultHandler : IRequestHandler<GetQueryResult, List<string>>
{
    private readonly IStringLocalizer<GetQueryResultHandler> _localizer;
    private readonly IDatabaseService _databaseService;

    public GetQueryResultHandler(
        IStringLocalizer<GetQueryResultHandler> localizer,
        IDatabaseService databaseService
    )
    {
        _localizer = localizer;
        _databaseService = databaseService;
    }

    public async Task<List<string>> Handle(GetQueryResult request, CancellationToken cancellationToken)
    {
        try
        {
            DataTable dtResult = new DataTable();

            dtResult = await _databaseService.ExecuteStoredProcedureAsync(request.queryString);

            List<string> distributors = dtResult.AsEnumerable()
                                                .Select(row => row.Field<string>("Distributor"))
                                                .ToList();

            return distributors;
        }
        catch (Exception)
        {
            throw;
        }
    }
}
