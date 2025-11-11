
namespace SFCTOFC.DailySalesPlanManagementApplication.Features.DSPM.DTOs;
public class OutletDto
{
    public int Id { get; set; }
    public string? Name { get; set; }
    public string? Address { get; set; }
    public string? Barangay { get; set; }
    public string? City { get; set; }
    public string? Province { get; set; }
    public string? Region { get; set; }
    public decimal? Latitude { get; set; }
    public decimal? Longitude { get; set; }
    public string? Channel { get; set; }
    public string? Salesman { get; set; }
    public string? Route { get; set; }
    public int? CallSequence { get; set; }
    public string? Image { get; set; }

    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<Outlets, OutletDto>().ReverseMap();
        }
    }
}
