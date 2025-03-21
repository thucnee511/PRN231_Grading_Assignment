using Cosmetic.Repositories;
using Cosmetic.Repositories.Models;

namespace Cosmetic.Services
{
    public interface ISystemAccountService
    {
        Task<SystemAccount?> Login(string email, string password);
    }
    public class SystemAccountService : ISystemAccountService
    {
        private readonly SystemAccountRepository systemAccountRepository;
        public SystemAccountService()
        {
            systemAccountRepository = new SystemAccountRepository();
        }

        public async Task<SystemAccount?> Login(string email, string password)
        {
            return await systemAccountRepository.Login(email, password);
        }
    }
}
