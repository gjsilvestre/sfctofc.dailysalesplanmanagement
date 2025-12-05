using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFCTOFC.DailySalesPlanManagement.Infrastructure.Persistence;
internal sealed class ApplicationDbContextFactory : IApplicationDbContextFactory
{
    private readonly IDbContextFactory<ApplicationDbContext> _efFactory;

    public ApplicationDbContextFactory(IDbContextFactory<ApplicationDbContext> efFactory)
    {
        _efFactory = efFactory;
    }

    public ValueTask<IApplicationDbContext> CreateAsync(CancellationToken ct = default)
    {
        var dbContext = _efFactory.CreateDbContext();
        return new ValueTask<IApplicationDbContext>(dbContext);
    }
}
