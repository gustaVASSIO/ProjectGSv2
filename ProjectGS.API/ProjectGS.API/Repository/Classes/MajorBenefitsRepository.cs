using ProjectGS.API.Context;
using ProjectGS.API.Models.Entities;
using ProjectGS.API.Repository.Interfaces;

namespace ProjectGS.API.Repository.Classes
{
    public class MajorBenefitsRepository : Repository<MajorBenefits>, IMajorBenefitsRepository
    {
        public MajorBenefitsRepository(AppDbContext context) : base(context)
        {
        }
    }
}
