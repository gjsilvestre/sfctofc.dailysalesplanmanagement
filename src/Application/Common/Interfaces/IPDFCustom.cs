
namespace SFCTOFC.DailySalesPlanManagementApplication.Common.Interfaces;

public interface IPDFCustom
{
    Task<byte[]> ExportCustomAsync<TData>(IEnumerable<TData> data,
        Dictionary<string, Func<TData, object?>> mappers,
        string title, PdfOrientation orientation);
    //Task<byte[]> ExportCustomLayoutAsync<TData>(TData data, string title);
}

public enum Orientation
{
    Portrait,
    Landscape
}