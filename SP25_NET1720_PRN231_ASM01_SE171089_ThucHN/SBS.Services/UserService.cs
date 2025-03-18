using SBS.Repositories;
using SBS.Repositories.Models;

namespace SBS.Services
{
    public interface IUserService
    {
        Task<List<User>> GetAllUsersAsync();
        Task<User?> GetUserAsync(Guid id);
        Task<List<User>> SearchUsers(string? username, string? email, string? status);
        Task<int> AddAsync(User user);
        Task<int> UpdateAsync(User user);
        Task<int> DeleteAsync(User id);
    }
    public class UserService : IUserService
    {
        private readonly UserRepository _userRepository;
        public UserService()
        {
            _userRepository = new();
        }
        public async Task<List<User>> GetAllUsersAsync()
            => await _userRepository.GetUsersAsync();
        public async Task<User?> GetUserAsync(Guid id)
            => await _userRepository.GetUserAsync(id);
        public async Task<List<User>> SearchUsers(string? username, string? email, string? status)
            => await _userRepository.Search(username, email, status);
        public async Task<int> AddAsync(User user)
            => await _userRepository.AddAsync(user);
        public async Task<int> UpdateAsync(User user)
            => await _userRepository.UpdateAsync(user);
        public async Task<int> DeleteAsync(User user)
            => await _userRepository.DeleteAsync(user);
    }
}
