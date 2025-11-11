using SFCTOFC.DailySalesPlanManagementApplication.Features.PicklistSets.DTOs;

namespace SFCTOFC.DailySalesPlanManagementApplication.Common.Interfaces;

public interface IPicklistService
{
    List<PicklistSetDto> DataSource { get; }
    event Func<Task>? OnChange;
    Task InitializeAsync();
    Task RefreshAsync();
}