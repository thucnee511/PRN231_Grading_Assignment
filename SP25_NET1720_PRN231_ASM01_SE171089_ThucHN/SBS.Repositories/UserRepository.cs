using Microsoft.EntityFrameworkCore;
using SBS.Repositories.Base;
using SBS.Repositories.Models;

namespace SBS.Repositories
{
    public class UserRepository : GenericRepository<User>
    {
        public UserRepository() : base()
        {
        }

        public async Task<List<User>> GetUsersAsync()
            => await DbSet.Include(item => item.Transactions).ToListAsync();

        public async Task<User?> GetUserAsync(Guid id)
            => await DbSet.Include(item => item.Transactions).FirstOrDefaultAsync(item => item.Id == id);

        public async Task<List<User>> Search(string? username, string? email, string? status)
            => await DbSet.Include(item => item.Transactions)
                .Where(item =>
                    (string.IsNullOrEmpty(username) || item.Username.Contains(username)) &&
                    (string.IsNullOrEmpty(email) || item.Email.Contains(email)) &&
                    (string.IsNullOrEmpty(status) || item.Status == status)
                )
                .ToListAsync();
    }
}
