
using System.Diagnostics;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.DSPM.EventHandlers;
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
