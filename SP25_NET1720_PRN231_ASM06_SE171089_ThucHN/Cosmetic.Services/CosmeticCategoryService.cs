using Cosmetic.Repositories;
using Cosmetic.Repositories.Models;

namespace Cosmetic.Services
{
    public interface ICosmeticCategoryService
    {
        Task<List<CosmeticCategory>> GetAll();
    }
    public class CosmeticCategoryService : ICosmeticCategoryService
    {
        private readonly CosmeticCategoryRepository genericRepository;
        public CosmeticCategoryService()
        {
            genericRepository = new ();
        }
        public async Task<List<CosmeticCategory>> GetAll()
        {
            return await genericRepository.GetAllAsync();
        }
    }
}
