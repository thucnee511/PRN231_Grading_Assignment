using Microsoft.EntityFrameworkCore;
using SBS.Repositories.Base;
using SBS.Repositories.Models;

namespace SBS.Repositories
{
    public class UserAccountRepository : GenericRepository<UserAccount>
    {
        public UserAccountRepository() : base()
        {
        }

        public async Task<UserAccount?> Login(string username, string password)
            => await DbSet.FirstOrDefaultAsync(item => item.UserName == username && item.Password == password && item.IsActive);
    }
}
