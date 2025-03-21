using Cosmetic.Repositories.Base;
using Cosmetic.Repositories.Models;
using Microsoft.EntityFrameworkCore;

namespace Cosmetic.Repositories
{
    public class SystemAccountRepository : GenericRepository<SystemAccount>
    {
        public SystemAccountRepository() { }

        public Task<SystemAccount?> Login(string email, string password)
            => _context.SystemAccounts
            .FirstOrDefaultAsync(x => x.EmailAddress == email && x.AccountPassword == password);
    }
}
