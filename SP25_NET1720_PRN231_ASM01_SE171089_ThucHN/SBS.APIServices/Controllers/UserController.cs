using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using SBS.Repositories.Models;
using SBS.Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SBS.APIServices.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    [EnableQuery]

    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpGet]
        [Authorize(Roles ="1,2")]
        public async Task<IEnumerable<User>> GetAll()
            => await _userService.GetAllUsersAsync();

        // GET api/<UserController>/5
        [HttpGet("{id}")]
        [Authorize(Roles = "1,2")]
        public async Task<User?> Get(Guid id)
            => await _userService.GetUserAsync(id);

        // POST api/<UserController>
        [HttpPost]
        [Authorize(Roles = "1,2")]
        public async Task<int> Post([FromBody] User user)
            => await _userService.AddAsync(user);

        // PUT api/<UserController>/5
        [HttpPut]
        [Authorize(Roles = "1,2")]
        public async Task<int> Put([FromBody] User user)
            => await _userService.UpdateAsync(user);

        // DELETE api/<UserController>/5
        [HttpDelete("{id}")]
        [Authorize(Roles = "1,2")]
        public async Task<bool> Delete(Guid id)
        {
            var user = await _userService.GetUserAsync(id);
            if (user == null)
            {
                return false;
            }
            return await _userService.DeleteAsync(user) != 0;
        }
    }
}
