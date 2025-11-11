
namespace SFCTOFC.DailySalesPlanManagementApplication.Features.DSPM.EventHandlers;
public class OutletUpdatedEventHandler : INotificationHandler<UpdatedEvent<Outlets>>
{
    private readonly ILogger<OutletUpdatedEventHandler> _logger;

    public OutletUpdatedEventHandler(
        ILogger<OutletUpdatedEventHandler> logger
    )
    {
        _logger = logger;
    }

    public Task Handle(UpdatedEvent<Outlets> notification, CancellationToken cancellationToken)
    {
        _logger.LogInformation("Handled domain event '{EventType}' with notification: {@Notification} ", notification.GetType().Name, notification);

        return Task.CompletedTask;
    }
}
