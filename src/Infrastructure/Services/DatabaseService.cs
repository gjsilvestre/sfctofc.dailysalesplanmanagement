//Gilbert J. Silvestre
//Contract for executing stored procedures in a database and returning the results as a DataTable.

using System.Collections;
using System.Data;
using Microsoft.Extensions.Configuration;
using SFCTOFC.Core.DataAccess;

namespace SFCTOFC.DailySalesPlanManagementInfrastructure.Services;
public class DatabaseService : IDatabaseService
{
    private readonly string _connectionString;

    public DatabaseService(IConfiguration configuration)
    {
        _connectionString = configuration.GetSection("DatabaseSettings:ConnectionString").Value;
    }

    public async Task<DataTable> ExecuteStoredProcedureAsync(string procedureName, DictionaryEntry[]? parameters = null)
    {
        var dataTable = new DataTable();

        new DataAccessConnection(_connectionString).Fill(dataTable, procedureName, CommandType.StoredProcedure, parameters);

        return dataTable;
    }

    public async Task<DataTable> ExecuteStoredProcedureAsync(string sqlQueryString)
    {
        var dataTable = new DataTable();

        new DataAccessConnection(_connectionString).Fill(dataTable, sqlQueryString, CommandType.Text);

        return dataTable;
    }
}
