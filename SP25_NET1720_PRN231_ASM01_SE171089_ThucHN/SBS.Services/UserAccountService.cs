using SBS.Repositories;
using SBS.Repositories.Models;

namespace SBS.Services
{
    public interface IUserAccountService
    {
        Task<UserAccount?> Login(string username, string password);
    }
    public class UserAccountService : IUserAccountService
    {
        private readonly UserAccountRepository _userAccountRepository;
        public UserAccountService()
        {
            _userAccountRepository = new();
        }
        public async Task<UserAccount?> Login(string username, string password)
            => await _userAccountRepository.Login(username, password);
    }
}
