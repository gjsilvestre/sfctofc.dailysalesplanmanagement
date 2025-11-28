
using System.Diagnostics;

namespace SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.EventHandlers;
public class OutletCreatedEventHandler : INotificationHandler<CreatedEvent<Outlets>>
{
    private readonly ILogger<OutletCreatedEventHandler> _logger;
    private readonly Stopwatch _timer;

    public OutletCreatedEventHandler(
        ILogger<OutletCreatedEventHandler> logger
    )
    {
        _logger = logger;
        _timer = new Stopwatch();
    }

    public async Task Handle(CreatedEvent<Outlets> notification, CancellationToken cancellationToken)
    {
        _timer.Start();
        await Task.Delay(3000, cancellationToken);

        _timer.Stop();
        _logger.LogInformation("Handled domain event '{EventType}' with notification: {@Notification} in {ElapsedMilliseconds} ms", notification.GetType().Name, notification, _timer.ElapsedMilliseconds);
    }
}

public class PurchaseOrderCreatedEventHandler : INotificationHandler<CreatedEvent<PurchaseOrder>>
{
    private readonly ILogger<PurchaseOrderCreatedEventHandler> _logger;
    private readonly Stopwatch _timer;

    public PurchaseOrderCreatedEventHandler(
        ILogger<PurchaseOrderCreatedEventHandler> logger
    )
    {
        _logger = logger;
        _timer = new Stopwatch();
    }

    public async Task Handle(CreatedEvent<PurchaseOrder> notification, CancellationToken cancellationToken)
    {
        _timer.Start();
        await Task.Delay(3000, cancellationToken);
        _timer.Stop();
        _logger.LogInformation("Handled domain event '{EventType}' with notification: {@Notification} in {ElapsedMilliseconds} ms", notification.GetType().Name, notification, _timer.ElapsedMilliseconds);
    }
}
