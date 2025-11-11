using System.Collections;
using SFCTOFC.DailySalesPlanManagementApplication.Features.Marketing.MRKDataParameters.Caching;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Marketing.MRKDataParameters.Queries.GetAll;
public class GetDataParamtersQuery : IRequest<Result<DataTable>>
{
    public string? mode { get; set; }
    public IEnumerable<string>? Tags => MRKDataParametersCacheKey.Tags;
}

public class GetDataParametersQueryHAndler : IRequestHandler<GetDataParamtersQuery, Result<DataTable>>
{
    private readonly IStringLocalizer<GetDataParametersQueryHAndler> _localizer;
    private readonly IDatabaseService _databaseService;

    public GetDataParametersQueryHAndler(
        IStringLocalizer<GetDataParametersQueryHAndler> localizer,
        IDatabaseService databaseService
    )
    {
        _localizer = localizer;
        _databaseService = databaseService;
    }

    public async Task<Result<DataTable>> Handle(GetDataParamtersQuery request, CancellationToken cancellationToken)
    {
        try
        {
            var dtResult = new DataTable();
            var paramInputs = new DictionaryEntry[]
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