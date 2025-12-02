
using SFCTOFC.DailySalesPlanManagement.Domain.Common.Entities;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace SFCTOFC.DailySalesPlanManagement.Domain.Entities;

public class Outlets : BaseAuditableEntity
{
    public string? Distributor { get; set; }
    public string? Salesman { get; set; }
    public string? Name { get; set; }
    public string? Channel { get; set; }
    public string? Owner { get; set; }
    public string? PhoneNumber { get; set; }
    public string? Address { get; set; }
    public string? Region { get; set; }
    public string? Province { get; set; }
    public string? City { get; set; }
    public string? Baranggay { get; set; }
    public string? Route { get; set; }
    public string? Frequency { get; set; }
    public int? CallSequence { get; set; }
    public string? Image { get; set; }
    public double? Latitude { get; set; } //float sa mssql
    public double? Longtitude { get; set; } //float sa mssql 
    public string? Comments { get; set; }
    public string? SubRoute1 { get; set; }
    public string? SubRoute2 { get; set; }
    public string? SubRoute3 { get; set; }
    public string? SubRoute4 { get; set; }
    public string? Supervisor { get; set; }
    public string? BusinessDivision { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }

}
