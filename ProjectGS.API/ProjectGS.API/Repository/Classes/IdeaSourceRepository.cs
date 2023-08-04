using ProjectGS.API.Context;
using ProjectGS.API.Models.Entities;
using ProjectGS.API.Repository.Interfaces;

namespace ProjectGS.API.Repository.Classes
{
    public class IdeaSourceRepository : Repository<IdeaSource>, IIdeaSourceRepository
    {
        public IdeaSourceRepository(AppDbContext context) : base(context)
        {
        }
    }
}
