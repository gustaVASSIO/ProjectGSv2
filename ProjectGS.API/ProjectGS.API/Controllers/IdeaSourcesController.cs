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
    public class IdeaSourcesController : ControllerBase
    {
        private IUnitOfWork uow;

        public IdeaSourcesController(IUnitOfWork uow)
        {
            this.uow = uow;
        }
        [HttpGet]
        public async Task<ActionResult<List<IdeaSource>>> GetIdeaSources()
        {
            var ideasources = await uow.IdeaSourceRepository.Get().ToArrayAsync();
            return Ok(ideasources);
        }

    }
}
