using ProjectGS.API.Context;
using ProjectGS.API.Models.Entities;
using ProjectGS.API.Repository.Interfaces;

namespace ProjectGS.API.Repository.Classes
{
    public class DepartmentRepository : Repository<Department>, IDepartmentRepository
    {
        public DepartmentRepository(AppDbContext context) : base(context)
        {
        }
    }
}
