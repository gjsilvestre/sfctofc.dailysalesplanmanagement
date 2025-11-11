using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFCTOFC.DailySalesPlanManagementApplication.Common.Interfaces;
public interface IPDFCustomPM
{

    Task<byte[]> ExportPMLayoutAsync<TData>(IEnumerable<TData> data
        , Dictionary<string, Func<TData, object?>> mappers
        , string title, PdfOrientation orientation);
}

public enum PMOrientation
{
    Portrait,
    Landscape

}
