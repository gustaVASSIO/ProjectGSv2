using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using ProjectGS.API.Data.ValueObjects.UserVOS;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace ProjectGS.API.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private UserManager<IdentityUser> _userManager;
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly IConfiguration _configuration;

        public AuthController(UserManager<IdentityUser> userManager, SignInManager<IdentityUser> signInManager, IConfiguration configuration)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _configuration = configuration;
        }

        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [HttpPost("Admin")]
        public async Task<ActionResult<UserTokenVO>> PostUserAdmin(UserRegisterVO vo)
        {
            if (vo.Password != vo.ConfirmPassword) return BadRequest("Passowrd Mismatch");

            IdentityUser user = new()
            {
                UserName = vo.UserName,
                Email = vo.Email,
                EmailConfirmed = true
            };

            var result = await _userManager.CreateAsync(user, vo.Password);

            if (!result.Succeeded) return BadRequest(result.Errors);

            await _signInManager.SignInAsync(user, false);

            await _userManager.AddToRoleAsync(user, "Admin");

            UserToTokenVO userToToken = new()
            {
                UserId = user.Id,
                UserName = vo.UserName,
                Role = "Admin"
            };

            return Ok(GenToken(userToToken));
        }

        [HttpPost("Reporter")]
        public async Task<ActionResult<UserTokenVO>> PostReporterAdmin(UserRegisterVO vo)
        {
            if (vo.Password != vo.ConfirmPassword) return BadRequest("Passowrd Mismatch");

            IdentityUser user = new()
            {
                UserName = vo.UserName,
                Email = vo.Email,
                EmailConfirmed = true
            };

            var result = await _userManager.CreateAsync(user, vo.Password);

            if (!result.Succeeded) return BadRequest(result.Errors);

            await _signInManager.SignInAsync(user, false);

            await _userManager.AddToRoleAsync(user, "Reporter");

            UserToTokenVO userToToken = new()
            {
                UserId = user.Id,
                UserName = vo.UserName,
                Role = "Reporter"
            };

            return Ok(GenToken(userToToken));
        }

        [HttpPost("Login")]
        public async Task<ActionResult<UserTokenVO>> Login(UserLoginVO vo)
        {
            var result = await _signInManager.PasswordSignInAsync(vo.UserName,
                vo.Password, isPersistent: false, lockoutOnFailure: false);

            if (!result.Succeeded) return BadRequest("Invalid Credentials");

            IdentityUser user = await _userManager.FindByNameAsync(vo.UserName);
            var roles = await _userManager.GetRolesAsync(user);

            UserToTokenVO userToToken = new()
            {
                UserId = user.Id,
                UserName = vo.UserName,
                Role = roles[0]
            };

            return Ok(GenToken(userToToken));
        }

        private UserTokenVO GenToken(UserToTokenVO vo)
        {
            //define declarações do usuario
            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.UniqueName, vo.UserName),
                new Claim("ets", "23#industria"),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };

            //gera uma chave com base em um algoritimo simetrico
            var key = new SymmetricSecurityKey(
                Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));

            //gerar assinatura digital usando o algoritimo Hmac e a chave privada
            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            //classe que representa um token JWT e gera o token
            JwtSecurityToken token = new JwtSecurityToken(
                issuer: _configuration["TokenConfiguration:Issuer"],
                audience: _configuration["TokenConfiguration:Audience"],
                claims: claims,
                signingCredentials: credentials);

            return new UserTokenVO()
            {
                UserId = vo.UserId,
                Token = new JwtSecurityTokenHandler().WriteToken(token),
                UserName = vo.UserName,
                Role = vo.Role
            };
        }
    }
}
