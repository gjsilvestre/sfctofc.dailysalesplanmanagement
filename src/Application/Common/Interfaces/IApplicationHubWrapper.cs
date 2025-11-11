namespace SFCTOFC.DailySalesPlanManagementApplication.Common.Interfaces;


public interface IApplicationHubWrapper
{
    Task JobStarted(int id,string message);
    Task JobCompleted(int id,string message);
}