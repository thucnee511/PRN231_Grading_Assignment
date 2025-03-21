using Cosmetic.Repositories.Models;
using Cosmetic.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Cosmetic.APIServices.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    [EnableQuery]
    public class CosmeticInformationController : ControllerBase
    {
        private readonly ICosmeticInformationService cosmeticInformationService;
        public CosmeticInformationController(ICosmeticInformationService cosmeticInformationService)
        {
            this.cosmeticInformationService = cosmeticInformationService;
        }
        // GET: api/<CosmeticInformationController>
        [HttpGet]
        [Authorize(Roles = "1,3,4")]
        public async Task<IEnumerable<CosmeticInformation>> Get()
        {
            return await cosmeticInformationService.GetAll();
        }

        // GET api/<CosmeticInformationController>/5
        [HttpGet("{id}")]
        [Authorize(Roles = "1,3,4")]
        public async Task<CosmeticInformation> Get(string id)
        {
            return await cosmeticInformationService.GetByID(id);
        }

        [HttpGet("Search")]
        [Authorize(Roles = "1,3,4")]
        public async Task<IEnumerable<CosmeticInformation>> Search([FromQuery]string? cosmeticName, [FromQuery] string? cosmeticSize, [FromQuery] string? skinSize)
        {
            return await cosmeticInformationService.Search(cosmeticName, cosmeticSize, skinSize);
        }

        // POST api/<CosmeticInformationController>
        [HttpPost]
        [Authorize(Roles = "1")]
        public async Task<int> Post([FromBody] CosmeticInformation item)
        {
            return await cosmeticInformationService.Create(item);
        }

        // PUT api/<CosmeticInformationController>/5
        [HttpPut]
        [Authorize(Roles = "1")]
        public async Task<int> Put([FromBody] CosmeticInformation item)
        {
            return await cosmeticInformationService.Update(item);
        }

        // DELETE api/<CosmeticInformationController>/5
        [HttpDelete("{id}")]
        [Authorize(Roles = "1")]
        public Task<bool> Delete(string id)
        {
            return cosmeticInformationService.Delete(id);
        }
    }
}
