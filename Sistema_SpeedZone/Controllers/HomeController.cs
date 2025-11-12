using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Sistema_SpeedZone.Models;

namespace Sistema_SpeedZone.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult segundaTela()
        {
            return View();
        }

        public IActionResult Brands()
        {
            return View();
        }

        public IActionResult Brands2()
        {
            return View();
        }

        public IActionResult Brands3()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
