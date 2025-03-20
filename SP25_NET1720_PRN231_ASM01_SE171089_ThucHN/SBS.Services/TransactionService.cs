using SBS.Repositories;
using SBS.Repositories.Models;

namespace SBS.Services
{
    public interface ITransactionService
    {
        Task<List<Transaction>> Search(string? paymentMethod, string? status, string? username);
        Task<List<Transaction>> GetTransactionsAsync();
        Task<Transaction?> GetTransactionAsync(Guid id);
        Task<int> AddAsync(Transaction transaction);
        Task<int> UpdateAsync(Transaction transaction);
        Task<int> DeleteAsync(Transaction transaction);
    }
    public class TransactionService : ITransactionService
    {
        private readonly TransactionRepository _transactionRepository;
        public TransactionService()
        {
            _transactionRepository = new();
        }
        public async Task<List<Transaction>> Search(string? paymentMethod, string? status, string? username)
            => await _transactionRepository.Search(paymentMethod, status, username);
        public async Task<List<Transaction>> GetTransactionsAsync()
            => await _transactionRepository.GetAllAsync();
        public async Task<Transaction?> GetTransactionAsync(Guid id)
            => await _transactionRepository.GetOneAsync(id);
        public async Task<int> AddAsync(Transaction transaction)
            => await _transactionRepository.AddAsync(transaction);
        public async Task<int> UpdateAsync(Transaction transaction)
            => await _transactionRepository.UpdateAsync(transaction);
        public async Task<int> DeleteAsync(Transaction transaction)
            => await _transactionRepository.DeleteAsync(transaction);
    }
}
