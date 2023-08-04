using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProjectGS.API.Repository.Interfaces;

namespace ProjectGS.API.Controllers
{
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class InfoFinantialController : ControllerBase
    {
        private IUnitOfWork uow;

        public InfoFinantialController(IUnitOfWork uow)
        {
            this.uow = uow;
        }

        [HttpGet("MonetaryBenefit/{costCenterId}")]
        public async Task<ActionResult> GetMonetaryBenefit(string costCenterId, [FromQuery] int reductionalHours)
        {
            double pricePerHour = await uow.InfoFinantialRepository.Get()
                .Where(x => x.CostCenterId == costCenterId && x.Status)
                .Select(x => x.PriceHour)
                .FirstOrDefaultAsync();

            return Ok(pricePerHour * reductionalHours);
        }

    }
}
