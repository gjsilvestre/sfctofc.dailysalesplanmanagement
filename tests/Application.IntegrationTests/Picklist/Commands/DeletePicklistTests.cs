using System.Threading.Tasks;
using SFCTOFC.DailySalesPlanManagementApplication.Common.ExceptionHandlers;
using SFCTOFC.DailySalesPlanManagementApplication.Features.PicklistSets.Commands.AddEdit;
using SFCTOFC.DailySalesPlanManagementApplication.Features.PicklistSets.Commands.Delete;
using SFCTOFC.DailySalesPlanManagementDomain.Entities;
using FluentAssertions;
using NUnit.Framework;

namespace SFCTOFC.DailySalesPlanManagementApplication.IntegrationTests.KeyValues.Commands;

using static Testing;

public class DeletePicklistTests : TestBase
{
    [Test]
    public void ShouldRequireValidKeyValueId()
    {
        var command = new DeletePicklistSetCommand(new[] { 99 });

        FluentActions.Invoking(() =>
            SendAsync(command)).Should().ThrowAsync<NotFoundException>();
    }

    [Test]
    public async Task ShouldDeleteKeyValue()
    {
        var addCommand = new AddEditPicklistSetCommand
        {
            Name = Picklist.Brand,
            Text = "Word",
            Value = "Word",
            Description = "For Test"
        };
        var result = await SendAsync(addCommand);

        await SendAsync(new DeletePicklistSetCommand(new[] { result.Data }));

        var item = await FindAsync<Document>(result.Data);

        item.Should().BeNull();
    }
}