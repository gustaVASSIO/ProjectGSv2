using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using ProjectGS.API.Data.ValueObjects;

namespace ProjectGS.API.Controllers
{
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class RolesController : ControllerBase
    {
        private RoleManager<IdentityRole> roleManager;

        public RolesController(RoleManager<IdentityRole> roleManager)
        {
            this.roleManager = roleManager;
        }

        [HttpPost]
        public async Task<ActionResult> PostRole(RoleVO role)
        {
            var roleData = new IdentityRole
            {
                Name = role.Name
            };

            await roleManager.CreateAsync(roleData);

            return StatusCode(StatusCodes.Status201Created);
        }

    }
}
