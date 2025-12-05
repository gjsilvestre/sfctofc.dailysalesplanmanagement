using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace SFCTOFC.DailySalesPlanManagement.Application.Features.SalesmanDailyPlan.Commands;
using MediatR;
using SFCTOFC.DailySalesPlanManagement.Application.Common.Interfaces;

public class UpdateTargetSalesCommand : IRequest<Result>
{
    public int Id { get; set; } // SalesmanDailyPlanId
    public decimal TargetSales { get; set; }
}


public class UpdateTargetSalesCommandHandler : IRequestHandler<UpdateTargetSalesCommand, Result>
{
    private readonly IApplicationDbContext _context; // Use the correct interface

    public UpdateTargetSalesCommandHandler(IApplicationDbContext context)
    {
        _context = context;
    }

    public async Task<Result> Handle(UpdateTargetSalesCommand request, CancellationToken cancellationToken)
    {
        var plan = await _context.SalesmanDailyPlans
                                 .FirstOrDefaultAsync(p => p.Id == request.Id, cancellationToken);

        if (plan == null)
        {
            return Result.Failure("Salesman daily plan not found."); 
        }

        plan.TargetSales = request.TargetSales;

        try
        {
            await _context.SaveChangesAsync(cancellationToken); // Correct context variable
            return Result.Success(); // Adjust based on your Result class
        }
        catch (Exception ex)
        {
            // Optionally log exception
            Console.WriteLine($"Error updating target sales: {ex.Message}");
            return Result.Failure("Error updating target sales.");
        }
    }
}
