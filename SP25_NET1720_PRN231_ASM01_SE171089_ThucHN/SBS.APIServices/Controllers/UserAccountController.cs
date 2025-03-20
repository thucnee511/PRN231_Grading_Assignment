using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using SBS.Repositories.Models;
using SBS.Services;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SBS.APIServices.Controllers
{
    public sealed record LoginReqeust(string UserName, string Password);

    [Route("api/[controller]")]
    [ApiController]
    public class UserAccountController : ControllerBase
    {
        private readonly IUserAccountService _userAccountService;
        private readonly IConfiguration _configuration;

        public UserAccountController(IUserAccountService userAccountService, IConfiguration configuration)
        {
            _userAccountService = userAccountService;
            _configuration = configuration;
        }

        [HttpPost("Login")]
        public async Task<IActionResult> Login([FromBody] LoginReqeust userAccount)
        {
            var user = await _userAccountService.Login(userAccount.UserName, userAccount.Password);
            if (user == null)
            {
                return Unauthorized();
            }
            var tokenString = GenerateJSONWebToken(user);
            return Ok(tokenString);
        }

        private string GenerateJSONWebToken(UserAccount user)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(_configuration["Jwt:Issuer"]
                    , _configuration["Jwt:Audience"]
                    ,
                    [
                        new(ClaimTypes.Name, user.UserName),
                        new(ClaimTypes.Role, user.RoleId.ToString()),
                    ],
                    expires: DateTime.Now.AddMinutes(120),
                    signingCredentials: credentials
                );

            var tokenString = new JwtSecurityTokenHandler().WriteToken(token);

            return tokenString;

        }
    }
}
