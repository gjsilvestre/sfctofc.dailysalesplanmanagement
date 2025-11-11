using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFCTOFC.CorporateSolutions.Application.Common.Interfaces;
public interface IProductionTicketMachineLogsRepository
{
    Task UpsertAsync(ProductionTicketMachineLogs machineLog, CancellationToken ct = default);
}