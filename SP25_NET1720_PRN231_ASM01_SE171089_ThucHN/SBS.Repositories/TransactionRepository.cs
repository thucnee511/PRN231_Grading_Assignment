using Microsoft.EntityFrameworkCore;
using SBS.Repositories.Base;
using SBS.Repositories.Models;

namespace SBS.Repositories
{
    public class TransactionRepository : GenericRepository<Transaction>
    {
        public TransactionRepository() : base()
        {
        }

        public async Task<List<Transaction>> GetAllTransactionsAsync()
            => await DbSet.Include(t => t.User).ToListAsync();
        public async Task<Transaction?> GetTransactionAsync(Guid id)
            => await DbSet.Include(t => t.User).FirstOrDefaultAsync(t => t.Id == id);
        public async Task<List<Transaction>> Search(string? paymentMethod, string? status, string? username)
            => await DbSet.Include(t => t.User)
                .Where(t =>
                    (string.IsNullOrEmpty(paymentMethod) || t.PaymentMethod == paymentMethod)
                    && (string.IsNullOrEmpty(status) || t.Status == status)
                    && (string.IsNullOrEmpty(username) || t.User.Username == username))
                .ToListAsync();
    }
}
