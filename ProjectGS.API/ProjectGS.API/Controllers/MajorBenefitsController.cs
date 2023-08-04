using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProjectGS.API.Models.Entities;
using ProjectGS.API.Repository.Interfaces;

namespace ProjectGS.API.Controllers
{
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class MajorBenefitsController : ControllerBase
    {
        private IUnitOfWork uow;

        public MajorBenefitsController(IUnitOfWork uow)
        {
            this.uow = uow;
        }

        [HttpGet]
        public async Task<ActionResult<List<MajorBenefits>>> GetMajorBenefits()
        {
            var majorbenefits = await uow.MajorBenefitsRepository.Get().ToListAsync();

            return Ok(majorbenefits);
        }
    }
}
