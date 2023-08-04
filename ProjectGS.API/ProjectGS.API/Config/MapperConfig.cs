using AutoMapper;
using Microsoft.AspNetCore.Identity;
using ProjectGS.API.Data.ValueObjects;
using ProjectGS.API.Data.ValueObjects.UserVOS;
using ProjectGS.API.Models.Entities;

namespace ProjectGS.API.Config
{
    public class MapperConfig
    {
        public static MapperConfiguration RegisterMaps()
        {
            var mappConfig = new MapperConfiguration(conf =>
            {
                conf.CreateMap<ImprovementVO, Improvement>().ReverseMap();
                conf.CreateMap<UserImprovementVO, IdentityUser>().ReverseMap();
            });
            return mappConfig;
        }
    }
}
