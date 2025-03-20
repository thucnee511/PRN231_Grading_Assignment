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
    }
}
