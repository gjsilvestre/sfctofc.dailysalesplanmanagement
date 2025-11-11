//Gilbert J. Silvestre
// This interface defines a contract for executing stored procedures in a database and returning the results as a DataTable.

using System.Collections;

namespace SFCTOFC.DailySalesPlanManagementApplication.Common.Interfaces;
public interface IDatabaseService
{
    Task<DataTable> ExecuteStoredProcedureAsync(string procedureName, DictionaryEntry[]? parameters = null);
    Task<DataTable> ExecuteStoredProcedureAsync(string sqlQueryString);
}
