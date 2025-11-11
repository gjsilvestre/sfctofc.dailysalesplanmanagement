using SFCTOFC.DailySalesPlanManagementApplication.Features.Tenants.DTOs;

namespace SFCTOFC.DailySalesPlanManagementApplication.Common.Interfaces.MultiTenant;

public interface ITenantService
{
    List<TenantDto> DataSource { get; }
    event Func<Task>? OnChange;
    Task InitializeAsync();
    Task RefreshAsync();
}