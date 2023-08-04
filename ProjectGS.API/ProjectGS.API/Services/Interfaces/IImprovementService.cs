using ProjectGS.API.Models.Entities;

namespace ProjectGS.API.Services.Interfaces
{
    public interface IImprovementService
    {
        Task<bool> PostImproveOnJira(Improvement improve);
    }
}
