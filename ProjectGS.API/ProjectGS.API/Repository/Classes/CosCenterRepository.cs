using ProjectGS.API.Repository.Interfaces;
using ProjectGS.API.Models.Entities;
using ProjectGS.API.Context;

namespace ProjectGS.API.Repository.Classes
{
    public class CosCenterRepository : Repository<CostCenter>, ICostCenterRepository
    {
        public CosCenterRepository(AppDbContext context) : base(context)
        {
        }
    }
}
