using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using Microsoft.EntityFrameworkCore;
using ProjectGS.API.Models.Entities;
using ProjectGS.API.Repository.Interfaces;

namespace ProjectGS.API.Controllers
{
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class DepartmentsController : ControllerBase
    {
        private IUnitOfWork uow;

        public DepartmentsController(IUnitOfWork uow)
        {
            this.uow = uow;
        }

        [HttpGet]
        //[EnableQuery]
        public async Task<ActionResult<List<Department>>> GetDepartments()
        {
            var departments = await uow.DepartmentRepository.Get()
                .Include(x => x.CurrentOrganization)
                .Include(x => x.Process)
                .Include(x => x.CostCenter)
                .ToListAsync();

            return Ok(departments);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Department>> GetDeartment(string id)
        {
            var department = await uow.DepartmentRepository.Get()
                .Include(x => x.CurrentOrganization)
                .Include(x => x.Process)
                .Include(x => x.CostCenter)
                .FirstOrDefaultAsync(x => x.DepartmentId == id);

            if (department == null)
                return BadRequest("Department not found");

            return Ok(department);
        }

    }
}
