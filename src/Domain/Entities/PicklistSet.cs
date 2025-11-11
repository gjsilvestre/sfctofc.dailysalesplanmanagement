
using System.ComponentModel;
using SFCTOFC.DailySalesPlanManagementDomain.Common.Entities;

namespace SFCTOFC.DailySalesPlanManagementDomain.Entities;

public class PicklistSet : BaseAuditableEntity, IAuditTrial
{
    public Picklist Name { get; set; } = Picklist.Brand;
    public string? Value { get; set; }
    public string? Text { get; set; }
    public string? Description { get; set; }
}

public enum Picklist
{
    [Description("STATUS")] Status,
    [Description("UNIT")] Unit,
    [Description("BRAND")] Brand,
    [Description("CURRENCY")] Currency,
    [Description("CIVIL STATUS")] CivilStatus,
    [Description("ADDRESS TYPE")] AddressType,
    [Description("EMPLOYEE TYPE")] EmployeeType,
    [Description("EMPLOYMENT STATUS")] EmploymentStatus,
    [Description("JOB POSITION")] JobPosition,
    [Description("JOB RANK")] JobRank,
    [Description("JOB GRADE")] JobGrade,
    [Description("JOB LEVEL")] JobLevel,
    [Description("SALARY FACTOR")] SalaryFactor,
    [Description("SALARY TAKE HOME")] SalaryTakeHome,
    [Description("DEDUCTION TYPE")] DeductionType,
    [Description("ALLOWANCE TYPE")] AllowanceType,
    [Description("ALLOWANCE FREQUENCY")] AllowancFrequency,
    [Description("SKILLS CATEGORY")] SkillsCategory,
    [Description("PRODUCTION TICKET MARSHMALLOW PROCESS")] ProductionTicketMarshmallowProcess,
    [Description("PRODUCTION TICKET CHOCOLATE PROCESS")] ProductionTicketChocolateProcess,
    [Description("PRODUCTION TICKET SCORE")] ProductionTicketScore,
    [Description("PRODUCTION SHIFT")] ProductionShift,
    [Description("WORK ORDER CATEGORY")] WorkOrderCategory,
    [Description("WORK ORDER PRIORITY")] WorkOrderPriority,
    [Description("WORK ORDER STATUS")] WorkOrderStatus,
    [Description("PM LOCATION")] PMLocation,
    [Description("PM CLASSIFICATION")] PMClassification,
    [Description("PM FREQUENCY")] PMFrequency,
    [Description("Schedule Type")] NOFScheduleType,
    [Description("Category")] NOFCategory,
    [Description("Type of Fault")] TypeOfFault,
    [Description("PM STATUS")] PMStatus,
    [Description("JOB REQ REASON")] JRQReason,
    [Description("JOB REQ PRIORITY")] JRQPriority,
    [Description("PRODUCTION TICKET MACHINE")] ProductionTicketMachine,
    [Description("PRODUCTION TICKET CHOCOLATE MACHINE")] ProductionTicketChocolateMachine
}
