using ProjectGS.API.Context;
using ProjectGS.API.Models.Entities;
using ProjectGS.API.Repository.Interfaces;

namespace ProjectGS.API.Repository.Classes
{
    public class InfoFinantilaRepository : Repository<InfoFinantial>, IInfoFinantialRepository
    {
        public InfoFinantilaRepository(AppDbContext context) : base(context)
        {
        }
    }
}
