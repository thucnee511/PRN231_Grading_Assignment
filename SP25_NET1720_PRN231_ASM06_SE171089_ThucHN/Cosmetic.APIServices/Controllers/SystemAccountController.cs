using Cosmetic.Repositories.Models;
using Cosmetic.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Cosmetic.APIServices.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SystemAccountController : ControllerBase
    {
        private readonly IConfiguration _config;
        private readonly ISystemAccountService systemAccountService;
        public SystemAccountController(ISystemAccountService systemAccountService, IConfiguration configuration)
        {
            this.systemAccountService = systemAccountService;
            this._config = configuration;
        }

        [HttpPost("Login")]
        public async Task<IActionResult> Login([FromBody] LoginRequest request)
        {
            var result = await systemAccountService.Login(request.Email, request.Password);
            if (result == null)
            {
                return Unauthorized();
            }
            var token = GenerateJSONWebToken(result);
            return Ok(token);
        }

        private string GenerateJSONWebToken(SystemAccount model)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(_config["Jwt:Issuer"]
                    , _config["Jwt:Audience"]
                    , new Claim[]
                    {
                new(ClaimTypes.Email, model.EmailAddress),
                new(ClaimTypes.Role, model.Role.ToString()),
                    },
                    expires: DateTime.Now.AddMinutes(120),
                    signingCredentials: credentials
                );

            var tokenString = new JwtSecurityTokenHandler().WriteToken(token);

            return tokenString;
        }

    }

    public record LoginRequest(string Email, string Password);
}
