using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Sistema_SpeedZone.Libraries.Login;
using Sistema_SpeedZone.Models;
using Sistema_SpeedZone.Repository.Contract;

namespace Sistema_SpeedZone.Controllers
{
    public class HomeController : Controller
    {
        /*private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }*/

        private IClienteRepository _clienteRepository;
        private LoginUsuario _loginUsuario;

        public HomeController(IClienteRepository clienteRepository, LoginUsuario loginUsuario)
        {
            _clienteRepository = clienteRepository;
            _loginUsuario = loginUsuario;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult segundaTela()
        {
            return View();
        }

        public IActionResult Cars()
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

       
        public IActionResult Cartao()
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
