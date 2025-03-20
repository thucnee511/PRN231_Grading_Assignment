using Microsoft.EntityFrameworkCore;
using SBS.Repositories.Models;

namespace SBS.Repositories.Base
{
    public class GenericRepository<T> where T : class
    {
        private DBContext? _context;
        private DbSet<T>? _dbSet;

        public GenericRepository()
        {
        }

        protected DBContext Context
        {
            get => _context ??= new DBContext();
        }
        protected DbSet<T> DbSet
        {
            get => _dbSet ??= Context.Set<T>();
        }

        public async Task<List<T>> GetAllAsync() => await DbSet.ToListAsync();
        public async Task<T?> GetOneAsync(Guid id) => await DbSet.FindAsync(id);
        public async Task<int> AddAsync(T item)
        {
            DbSet.Add(item);
            return await Context.SaveChangesAsync();
        }
        public async Task<int> UpdateAsync(T item)
        {
            var tracker = Context.Attach(item);
            tracker.State = EntityState.Modified;
            return await Context.SaveChangesAsync();
        }
        public async Task<int> DeleteAsync(T item)
        {
            DbSet.Remove(item);
            return await Context.SaveChangesAsync();
        }
    }
}
