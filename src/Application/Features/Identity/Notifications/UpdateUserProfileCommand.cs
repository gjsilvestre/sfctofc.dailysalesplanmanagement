namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Identity.Notifications;

public class UpdateUserProfileCommand : INotification
{
    public UserProfile UserProfile { get; set; } = null!;
}

public class UpdateUserProfileEventArgs : EventArgs
{
    public UserProfile UserProfile { get; set; } = null!;
}