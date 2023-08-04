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
    public class SourceTypesController : ControllerBase
    {
        private IUnitOfWork uow;

        public SourceTypesController(IUnitOfWork uow)
        {
            this.uow = uow;
        }

        [HttpGet]
        public async Task<ActionResult<List<SourceType>>> GetSourceTypes()
        {
            var sourcetypes = await uow.SourceTypeRepository.Get().ToListAsync();
            return Ok(sourcetypes);
        }

    }
}
