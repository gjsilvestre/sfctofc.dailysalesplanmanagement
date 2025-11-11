
namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Products.EventHandlers;

public class ProductUpdatedEventHandler : INotificationHandler<UpdatedEvent<Product>>
{
    private readonly ILogger<ProductUpdatedEventHandler> _logger;

    public ProductUpdatedEventHandler(
        ILogger<ProductUpdatedEventHandler> logger
    )
    {
        _logger = logger;
    }

    public Task Handle(UpdatedEvent<Product> notification, CancellationToken cancellationToken)
    {
        _logger.LogInformation("Handled domain event '{EventType}' with notification: {@Notification} ", notification.GetType().Name, notification);

        return Task.CompletedTask;
    }
}