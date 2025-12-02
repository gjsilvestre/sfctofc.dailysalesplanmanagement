using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.DTOs;
using SFCTOFC.DailySalesPlanManagement.Application.Features.DSPM.Commands.AddEdit;
using SFCTOFC.DailySalesPlanManagement.Domain.Identity;
using SFCTOFC.DailySalesPlanManagement.Infrastructure.Services.Identity;

namespace SFCTOFC.DailySalesPlanManagement.Server.UI.Controllers;

[ApiController]
[Microsoft.AspNetCore.Mvc.Route("api/[controller]")]
public class PurchaseOrderController : ControllerBase
{
    private readonly IMediator _mediator;
    public PurchaseOrderController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpPost("submit")]
    public async Task<IActionResult> SubmitPurchaseOrder([FromBody] PurchaseOrderDto request)
    {
        var result = await _mediator.Send(new SubmitPurchaseOrderCommand(request));

        if (!result.Succeeded) return BadRequest(result.ErrorMessage);

        return Ok(new { id = result.Data, message = "Purchase order saved successfully." });
    }
}



