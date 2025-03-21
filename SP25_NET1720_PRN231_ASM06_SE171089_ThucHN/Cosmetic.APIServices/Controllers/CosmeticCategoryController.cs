using Cosmetic.Repositories.Models;
using Cosmetic.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Cosmetic.APIServices.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class CosmeticCategoryController : ControllerBase
    {
        private readonly ICosmeticCategoryService cosmeticCategoryService;
        public CosmeticCategoryController(ICosmeticCategoryService cosmeticCategoryService)
        {
            this.cosmeticCategoryService = cosmeticCategoryService;
        }
        // GET: api/<CosmeticCategoryController>
        [HttpGet]
        public async Task<IEnumerable<CosmeticCategory>> Get()
        {
            return await cosmeticCategoryService.GetAll();
        }
    }
}
