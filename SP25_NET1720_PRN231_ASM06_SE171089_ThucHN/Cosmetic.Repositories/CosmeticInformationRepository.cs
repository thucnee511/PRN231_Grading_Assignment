using Cosmetic.Repositories.Base;
using Cosmetic.Repositories.Models;
using Microsoft.EntityFrameworkCore;

namespace Cosmetic.Repositories
{
    public class CosmeticInformationRepository : GenericRepository<CosmeticInformation>
    {
        public CosmeticInformationRepository() { }

        public async Task<List<CosmeticInformation>> GetAll()
            => await _context.CosmeticInformations.Include(item => item.Category).ToListAsync();
        public async Task<CosmeticInformation?> GetByID(string id)
            => await _context.CosmeticInformations.Include(item => item.Category).FirstOrDefaultAsync(item => item.CosmeticId == id);
        public async Task<List<CosmeticInformation>> Search(string? cosmeticName, string? cosmeticSize, string? skinSize) 
            => await _context.CosmeticInformations.Include(item => item.Category)
                .Where(item => (cosmeticName == null || item.CosmeticName.Contains(cosmeticName)) &&
                               (cosmeticSize == null || item.CosmeticSize.Contains(cosmeticSize)) &&
                               (skinSize == null || item.SkinType.Contains(skinSize)))
                .ToListAsync();
    }
}
