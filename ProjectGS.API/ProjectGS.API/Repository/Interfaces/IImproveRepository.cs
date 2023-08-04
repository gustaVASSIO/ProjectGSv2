using ProjectGS.API.Models.Entities;

namespace ProjectGS.API.Repository.Interfaces
{
    public  interface IImproveRepository : IRepository<Improvement>
    {
        Task<IEnumerable<Improvement>> GetImprovesByUserId(string userId);
    }
}
