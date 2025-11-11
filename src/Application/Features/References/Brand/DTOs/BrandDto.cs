using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.References.REFBrand.DTOs;
[Description("Brands")]
public class BrandDto
{
    [Description("Id")] public int Id { get; set; }
    [Description("Brand Code")] public string? BrandCode { get; set; }
    [Description("Brand Name")] public string? BrandName { get; set; }

    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<Brands, BrandDto>().ReverseMap();

            CreateMap<BrandDto, Brands>(MemberList.None)

            .ForMember(dest => dest.Created, opt => opt.Ignore())
            .ForMember(dest => dest.CreatedBy, opt => opt.Ignore())
            .ForMember(dest => dest.LastModified, opt => opt.Ignore())
            .ForMember(dest => dest.LastModifiedBy, opt => opt.Ignore())
            //.ForMember(dest => dest.CreatedByUser, opt => opt.Ignore())
            //.ForMember(dest => dest.LastModifiedByUser, opt => opt.Ignore())
            //.ForMember(dest => dest.Tenant, opt => opt.Ignore())
            //.ForMember(dest => dest.TenantId, opt => opt.Ignore())
            //.ForMember(dest => dest.TenantName, opt => opt.Ignore())
            .ForMember(dest => dest.DomainEvents, opt => opt.Ignore());

        }
    }
}
