using Cosmetic.Repositories;
using Cosmetic.Repositories.Models;

namespace Cosmetic.Services
{
    public interface ICosmeticInformationService
    {
        Task<List<CosmeticInformation>> GetAll();
        Task<CosmeticInformation?> GetByID(string id);
        Task<List<CosmeticInformation>> Search(string? cosmeticName, string? cosmeticSize, string? skinSize);
        Task<int> Create(CosmeticInformation item);
        Task<int> Update(CosmeticInformation item);
        Task<bool> Delete(string id);
    }
    public class CosmeticInformationService : ICosmeticInformationService
    {
        private readonly CosmeticInformationRepository cosmeticInformationRepository;
        public CosmeticInformationService()
        {
            cosmeticInformationRepository = new CosmeticInformationRepository();
        }

        public async Task<int> Create(CosmeticInformation item)
        {
            if (item.CosmeticSize.Length > 80 || item.CosmeticSize.Length < 2) return 0;
            if (item.CosmeticName.Length > 80 || item.CosmeticName.Length < 2) return 0;
            if (item.DollarPrice <= 0) return 0;
            //o	Value for CosmeticName includes a-z, A-Z, space, @, # and digit 0-9. 
            foreach (char c in item.CosmeticName)
            {
                if (!char.IsLetterOrDigit(c) && c != ' ' && c != '@' && c != '#') return 0;
            }
            //Each word of the CosmeticName must begin with the capital letter.
            string[] words = item.CosmeticName.Split(' ');
            foreach (string word in words)
            {
                if (char.IsLower(word[0])) return 0;
            }
            return await cosmeticInformationRepository.CreateAsync(item);
        }

        public async Task<bool> Delete(string id)
        {
            var item = await cosmeticInformationRepository.GetByIdAsync(id);
            if (item == null) return false;
            return await cosmeticInformationRepository.RemoveAsync(item);
        }

        public async Task<List<CosmeticInformation>> GetAll()
        {
            return await cosmeticInformationRepository.GetAll();
        }

        public async Task<CosmeticInformation?> GetByID(string id)
        {
            return await cosmeticInformationRepository.GetByID(id);
        }

        public async Task<List<CosmeticInformation>> Search(string? cosmeticName, string? cosmeticSize, string? skinSize)
        {
            return await cosmeticInformationRepository.Search(cosmeticName, cosmeticSize, skinSize);
        }

        public async Task<int> Update(CosmeticInformation item)
        {
            return await cosmeticInformationRepository.UpdateAsync(item);
        }
    }
}
