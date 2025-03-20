using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using SBS.Repositories.Models;
using SBS.Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SBS.APIServices.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    [EnableQuery]
    public class TransactionController : ControllerBase
    {
        private readonly ITransactionService _transactionService;

        public TransactionController(ITransactionService transactionService)
        {
            _transactionService = transactionService;
        }
        // GET: api/<TransactionController>
        [HttpGet]
        [Authorize(Roles = "1,2")]
        public async Task<IEnumerable<Transaction>> Get()
            => await _transactionService.GetTransactionsAsync();

        // GET api/<TransactionController>/5
        [HttpGet("{id}")]
        [Authorize(Roles = "1,2")]
        public async Task<Transaction?> Get(Guid id)
            => await _transactionService.GetTransactionAsync(id);

        // POST api/<TransactionController>
        [HttpPost]
        [Authorize(Roles = "1,2")]
        public async Task<int> Post([FromBody] Transaction transaction)
            => await _transactionService.AddAsync(transaction);

        // PUT api/<TransactionController>/5
        [HttpPut]
        [Authorize(Roles = "1,2")]
        public async Task<int> Put([FromBody] Transaction transaction)
            => await _transactionService.UpdateAsync(transaction);

        // DELETE api/<TransactionController>/5
        [HttpDelete("{id}")]
        [Authorize(Roles = "1,2")]
        public async Task<bool> Delete(Guid id)
        {
            var transaction = await _transactionService.GetTransactionAsync(id);
            if (transaction == null)
            {
                return false;
            }
            return await _transactionService.DeleteAsync(transaction) != 0;
        }

        [HttpGet("Search")]
        [Authorize(Roles = "1,2")]
        public async Task<IEnumerable<Transaction>> Search([FromQuery] string paymentMethod, [FromQuery] string status, [FromQuery] string username)
            => await _transactionService.Search(paymentMethod, status, username);
    }
}
