using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using SBS.Repositories.Models;

namespace SBS.Clients.MVC.Controllers
{
    public class TransactionsController : Controller
    {
        private readonly string APIEndpoint = "http://localhost:5046/api/";

        public TransactionsController()
        {
        }

        // GET: Transactions
        public async Task<IActionResult> Index()
        {
            using (var httpClient = new HttpClient())
            {
                var tokenString = HttpContext.Request.Cookies
                    .FirstOrDefault(c => c.Key == "TokenString").Value;
                httpClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenString);
                using (var response = await httpClient.GetAsync(APIEndpoint + "Transaction"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        var transactions = await response.Content.ReadAsStringAsync();
                        var reult = JsonConvert.DeserializeObject<List<Transaction>>(transactions);
                        if (reult != null)
                        {
                            return View(reult);
                        }
                    }
                }
                return View(new List<Transaction>());
            }
        }

        public async Task<IActionResult> Search(string? paymentMethod, string? status, string? username)
        {
            using (var httpClient = new HttpClient())
            {
                #region Add Token to header of Request

                var tokenString = HttpContext.Request.Cookies.FirstOrDefault(c => c.Key == "TokenString").Value;

                httpClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenString);

                #endregion

                using (var response = await httpClient.GetAsync(APIEndpoint + "Schedule/search?paymentMethod=" + paymentMethod + "&status=" + status + "&username=" + username))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        var content = await response.Content.ReadAsStringAsync();
                        var result = JsonConvert.DeserializeObject<List<Transaction>>(content);

                        if (result != null)
                        {
                            return View("Index", result);
                        }
                    }
                }
            }
            return View("Index", new List<Transaction>());
        }

        // GET: Transactions/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            using (var httpClient = new HttpClient())
            {
                var tokenString = HttpContext.Request.Cookies
                    .FirstOrDefault(c => c.Key == "TokenString").Value;
                httpClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenString);
                using (var response = await httpClient.GetAsync(APIEndpoint + "Transaction/" + id.ToString()))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        var transactions = await response.Content.ReadAsStringAsync();
                        var reult = JsonConvert.DeserializeObject<Transaction>(transactions);
                        if (reult != null)
                        {
                            return View(reult);
                        }
                    }
                }
                return View();
            }
        }

        private async Task<List<User>> GetUsers()
        {
            var users = new List<User>();
            using (var httpClient = new HttpClient())
            {
                #region Add Token to header of Request

                var tokenString = HttpContext.Request.Cookies.FirstOrDefault(c => c.Key == "TokenString").Value;
                httpClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenString);

                #endregion

                using (var response = await httpClient.GetAsync(APIEndpoint + "User"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        var content = await response.Content.ReadAsStringAsync();
                        users = JsonConvert.DeserializeObject<List<User>>(content);
                    }
                }
            }
            return users;
        }
        // GET: Transactions/Create
        public async Task<IActionResult> Create()
        {
            ViewData["UserId"] = new SelectList(await GetUsers(), "Id", "Username");
            return View();
        }

        // POST: Transactions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,UserId,Amount,PaymentMethod,Timestamp,Status,CreatedAt,UpdatedAt")] Transaction transaction)
        {
            if (ModelState.IsValid)
            {
                using (var httpClient = new HttpClient())
                {
                    #region Add Token to header of Request

                    var tokenString = HttpContext.Request.Cookies.FirstOrDefault(c => c.Key == "TokenString").Value;
                    httpClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenString);

                    #endregion

                    using (var response = await httpClient.PostAsJsonAsync(APIEndpoint + "Transaction", transaction))
                    {
                        if (response.IsSuccessStatusCode)
                        {
                            var content = await response.Content.ReadAsStringAsync();
                            var result = JsonConvert.DeserializeObject<int>(content);
                            if (result > 0)
                            {
                                return RedirectToAction(nameof(Index));
                            }
                        }
                    }
                }

            }
            ViewData["UserId"] = new SelectList(await GetUsers(), "Id", "Username", transaction.UserId);
            return View(transaction);
        }

        // GET: Transactions/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            var Users = await GetUsers();
            using (var httpClient = new HttpClient())
            {
                #region Add Token to header of Request

                var tokenString = HttpContext.Request.Cookies.FirstOrDefault(c => c.Key == "TokenString").Value;
                httpClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenString);

                #endregion

                using (var response = await httpClient.GetAsync(APIEndpoint + "Transaction/" + id))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        var content = await response.Content.ReadAsStringAsync();
                        var result = JsonConvert.DeserializeObject<Transaction>(content);
                        if (result != null)
                        {
                            ViewData["UserId"] = new SelectList(Users, "Id", "Username", result.UserId);
                            return View(result);
                        }
                    }
                }
            }
            return NotFound();
        }

        // POST: Transactions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id, [Bind("Id,UserId,Amount,PaymentMethod,Timestamp,Status,CreatedAt,UpdatedAt")] Transaction transaction)
        {
            if (ModelState.IsValid)
            {
                using (var httpClient = new HttpClient())
                {
                    #region Add Token to header of Request

                    var tokenString = HttpContext.Request.Cookies.FirstOrDefault(c => c.Key == "TokenString").Value;
                    httpClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenString);

                    #endregion

                    using (var response = await httpClient.PutAsJsonAsync(APIEndpoint + "Transaction", transaction))
                    {
                        if (response.IsSuccessStatusCode)
                        {
                            var content = await response.Content.ReadAsStringAsync();
                            var result = JsonConvert.DeserializeObject<int>(content);
                            if (result > 0)
                            {
                                return RedirectToAction(nameof(Index));
                            }
                        }
                    }
                }
            }
            ViewData["UserId"] = new SelectList(await GetUsers(), "UserId", "Username", transaction.UserId);
            return View(transaction);
        }

        // GET: Transactions/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            using (var httpClient = new HttpClient())
            {
                #region Add Token to header of Request

                var tokenString = HttpContext.Request.Cookies.FirstOrDefault(c => c.Key == "TokenString").Value;

                httpClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenString);

                #endregion

                using (var response = await httpClient.GetAsync(APIEndpoint + "Transaction/" + id))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        var content = await response.Content.ReadAsStringAsync();
                        var result = JsonConvert.DeserializeObject<Transaction>(content);
                        if (result != null)
                        {
                            return View(result);
                        }
                    }
                }
            }
            return NotFound();
        }

        // POST: Transactions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            using (var httpClient = new HttpClient())
            {
                #region Add Token to header of Request

                var tokenString = HttpContext.Request.Cookies.FirstOrDefault(c => c.Key == "TokenString").Value;
                httpClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenString);

                #endregion

                using (var response = await httpClient.DeleteAsync(APIEndpoint + "Transaction/" + id))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        return RedirectToAction(nameof(Index));
                    }
                }
            }

            return RedirectToAction(nameof(Index));
        }

        public IActionResult Users()
        {
            return View();
        }
    }
}
