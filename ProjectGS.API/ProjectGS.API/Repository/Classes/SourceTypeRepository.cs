using ProjectGS.API.Context;
using ProjectGS.API.Models.Entities;
using ProjectGS.API.Repository.Interfaces;

namespace ProjectGS.API.Repository.Classes
{
    public class SourceTypeRepository : Repository<SourceType>, ISourceTypeRepository
    {
        public SourceTypeRepository(AppDbContext context) : base(context)
        {
        }
    }
}
