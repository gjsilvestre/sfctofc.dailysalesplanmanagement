
namespace SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.EventHandlers;
public class OutletDeletedEventHandler : INotificationHandler<DeletedEvent<Outlets>>
{
    private readonly ILogger<OutletDeletedEventHandler> _logger;

    public OutletDeletedEventHandler(
        ILogger<OutletDeletedEventHandler> logger
    )
    {
        _logger = logger;
    }

    public Task Handle(DeletedEvent<Outlets> notification, CancellationToken cancellationToken)
    {
        _logger.LogInformation("Handled domain event '{EventType}' with notification: {@Notification} ", notification.GetType().Name, notification);
        return Task.CompletedTask;
    }
}

public class PurchaseOrderDeletedEventHandler : INotificationHandler<DeletedEvent<PurchaseOrder>>
{
    private readonly ILogger<PurchaseOrderDeletedEventHandler> _logger;

    public PurchaseOrderDeletedEventHandler(
        ILogger<PurchaseOrderDeletedEventHandler> logger
    )
    {
        _logger = logger;
    }

    public Task Handle(DeletedEvent<PurchaseOrder> notification, CancellationToken cancellationToken)
    {
        _logger.LogInformation("Handled domain event '{EventType}' with notification: {@Notification} ", notification.GetType().Name, notification);
        return Task.CompletedTask;
    }
}
