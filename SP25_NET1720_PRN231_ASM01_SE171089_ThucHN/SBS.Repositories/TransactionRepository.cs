using SBS.Repositories.Base;
using SBS.Repositories.Models;

namespace SBS.Repositories
{
    public class TransactionRepository : GenericRepository<Transaction>
    {
        public TransactionRepository() : base()
        {
        }
    }
}
