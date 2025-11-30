using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFCTOFC.DailySalesPlanManagement.Application.DSPMOutletTasks.Commands.AddEdit;
public class CreateOutletTaskCommand : IRequest<int>
{
    public int SalesmanDailyPlanId { get; set; }
    public int CreatedByUserId { get; set; }
    public int AssignedToUserId { get; set; }
    public string? TaskName { get; set; }
    public string? Notes { get; set; }
}
public class CreateOutletTaskCommandHandler
    : IRequestHandler<CreateOutletTaskCommand, int>
{
    private readonly IApplicationDbContext _context;
    private readonly IMapper _mapper;

    public CreateOutletTaskCommandHandler(
        IApplicationDbContext context,
        IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<int> Handle(CreateOutletTaskCommand request, CancellationToken cancellationToken)
    {
        var task = new OutletTasks
        {
            SalesmanDailyPlanId = request.SalesmanDailyPlanId,
            CreatedByUserId = request.CreatedByUserId,
            AssignedToUserId = request.AssignedToUserId,
            TaskName = request.TaskName,
            Notes = request.Notes,
            CreatedAt = DateTime.UtcNow
        };

        _context.OutletTasks.Add(task);
        await _context.SaveChangesAsync(cancellationToken);

        return task.Id;
    }
}
